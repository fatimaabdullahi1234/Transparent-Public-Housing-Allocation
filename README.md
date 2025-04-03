# Transparent Public Housing Allocation System

A blockchain-based system for transparent and fair allocation of public housing using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a transparent, tamper-proof way to manage public housing allocation. By leveraging blockchain technology, it ensures fairness in the allocation process and maintains a permanent record of all housing-related transactions.

## Components

### Smart Contracts

1. **Property Registration Contract** (`property-registration.clar`)
    - Records details of available housing units
    - Manages property information and availability status
    - Provides property lookup functionality

2. **Applicant Verification Contract** (`applicant-verification.clar`)
    - Validates eligibility of potential residents
    - Stores applicant information and verification status
    - Assigns eligibility scores based on predefined criteria

3. **Allocation Contract** (`allocation.clar`)
    - Manages fair distribution of housing opportunities
    - Links properties to verified applicants
    - Tracks allocation status and expiration dates

4. **Compliance Monitoring Contract** (`compliance-monitoring.clar`)
    - Ensures ongoing adherence to program requirements
    - Records inspection results and compliance status
    - Maintains historical compliance records

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) for local development and testing
- [Stacks Wallet](https://www.hiro.so/wallet) for interacting with the deployed contracts

### Installation

1. Clone the repository:
