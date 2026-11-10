# Enterprise User Lifecycle Management Tool (PowerShell)

## Overview
An automated PowerShell script designed for IT Service Desk operations to streamline user onboarding. The script reads employee details from a structured CSV file, dynamically generates secure temporary credentials, and outputs an audit log for compliance and record-keeping.

## Key Features
* **Batch Processing:** Parses structured CSV data to automate repetitive administrative tasks.
* **Security & Compliance:** Generates randomized temporary passwords and writes actions to an audit log (`onboarding_audit.log`).
* **Error Handling:** Verifies input file existence before execution to prevent failure.

## Usage
1. Populate `users.csv` with new hire details.
2. Run the script in PowerShell:
   ```powershell
   .\Onboard-Users.ps1