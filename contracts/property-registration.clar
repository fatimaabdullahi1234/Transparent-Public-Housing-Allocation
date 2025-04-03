;; Property Registration Contract
;; Records details of available housing units

(define-data-var admin principal tx-sender)

;; Property structure
(define-map properties
  { property-id: uint }
  {
    owner: principal,
    location: (string-utf8 100),
    size: uint,
    bedrooms: uint,
    available: bool,
    price: uint
  }
)

;; Property ID counter
(define-data-var property-id-counter uint u0)

;; Check if caller is admin
(define-private (is-admin)
  (is-eq tx-sender (var-get admin))
)

;; Register a new property
(define-public (register-property
    (location (string-utf8 100))
    (size uint)
    (bedrooms uint)
    (price uint))
  (let
    ((new-id (+ (var-get property-id-counter) u1)))
    (begin
      (asserts! (is-admin) (err u403))
      (var-set property-id-counter new-id)
      (map-set properties
        { property-id: new-id }
        {
          owner: tx-sender,
          location: location,
          size: size,
          bedrooms: bedrooms,
          available: true,
          price: price
        }
      )
      (ok new-id)
    )
  )
)

;; Update property availability
(define-public (set-property-availability (property-id uint) (available bool))
  (let
    ((property (unwrap! (map-get? properties { property-id: property-id }) (err u404))))
    (begin
      (asserts! (is-admin) (err u403))
      (map-set properties
        { property-id: property-id }
        (merge property { available: available })
      )
      (ok true)
    )
  )
)

;; Get property details
(define-read-only (get-property (property-id uint))
  (map-get? properties { property-id: property-id })
)

;; Get all property IDs
(define-read-only (get-property-count)
  (var-get property-id-counter)
)

;; Transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (begin
    (asserts! (is-admin) (err u403))
    (var-set admin new-admin)
    (ok true)
  )
)
