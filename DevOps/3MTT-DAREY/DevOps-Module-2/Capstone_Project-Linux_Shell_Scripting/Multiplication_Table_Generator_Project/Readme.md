# Multiplication Table Generator

https://img.shields.io/badge/Shell_Script-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white

https://img.shields.io/badge/License-MIT-blue?style=for-the-badge

https://img.shields.io/badge/CI-Ready-green?style=for-the-badge

A simple and interactive **Bash script** that generates multiplication tables in both full and custom ranges. Designed with error handling, clean CLI interaction, and educational value in mind, this tool is perfect for learners, developers, and system administrators wanting to practice scripting fundamentals.

## Project Overview

A professional-grade Bash script that generates customizable multiplication tables with:
✔ Interactive prompts for number and range selection
✔ Dual loop implementations (list-form & C-style)
✔ Robust input validation and error handling
✔ Colorized output for enhanced user experience
✔ Modular design following Linux/Unix best practices


## Features

- ✅ Clean, interactive CLI with color-coded feedback  
- ✅ Supports full table (1–10) or custom range selection 
- ✅ Input validation for numbers and ranges  
- ✅ Friendly exit and restart options  
- ✅ Two output formats: classic list and C-style  
- ✅ Portable: runs on any Unix/Linux/macOS environment with Bash

## Project Structure

<pre>
Multiplication_Table_Generator_Project/
├── Screenshot   # This folder contains screenshot
├── multiplication-table.sh # Main script file
└── README.md # Project documentation
</pre>

## Requirements

- Bash (v4.0 or higher recommended)
- Unix-like OS (Linux, macOS, or WSL on Windows)

## Installation

Clone the repository or copy the script manually:

```bash
# Download script
curl -LO https://github.com/your-repo/multiplication-table/raw/main/multitable.sh

# Navigate to the folder directory
cd multiplication-table

# Make executable
chmod +x multiplication-table.sh
```

## Usage

To run the script:

```bash
./multiplication-table.sh
```

## Example Interaction

```bash
Copy
Edit
=== Multiplication Table Generator ===

Enter a number (0–999): 5

Select multiplication range:
1) Full Table (1–10)
2) Custom Range
3) Quit

Enter choice [1-3]: 2
Enter start (1–10): 4
Enter end (4–10): 7

Multiplication Table (list format):
5 x  4 =  20
5 x  5 =  25
5 x  6 =  30
5 x  7 =  35

Multiplication Table (cstyle format):
5 x  4 =  20
5 x  5 =  25
5 x  6 =  30
5 x  7 =  35
```

## Error Handling
- Non-numeric or out-of-range inputs are gracefully rejected.

- Invalid range (e.g. start > end) prompts user-friendly feedback.

- Users are guided step-by-step, minimizing frustration.

## Technical Details

### Code Structure

```bash
multitable.sh
├── #!/bin/bash                  # Shebang for portability
├── COLOR VARIABLES              # ANSI color codes
├── FUNCTIONS:                   # Modular components
│   ├── validate_number()        # Numeric input check
│   ├── validate_range()         # Range boundary validation
│   └── generate_table()         # Core logic with style parameter
└── MAIN EXECUTION               # Interactive flow with restart
```

### Validation Logic
```bash
validate_number() {
    [[ "$1" =~ ^[0-9]+$ ]] || {
        echo -e "${RED}Error: Not a valid number${NC}"
        return 1
    }
}
```

### Example Output

<pre>
=== Multiplication Table Generator ===
Enter a number (0-999): 7
Choose table type: 
1) Full (1-10)    2) Custom Range    3) Quit
#? 1

Multiplication Table (list):
 7 x  1 =   7
 7 x  2 =  14
...
 7 x 10 =  70

Generate another table? (y/n): n
</pre>

## Learning Outcomes

### Core Bash Scripting:

- Loop structures (for, while)
- Conditional logic (if-elif-else, case)
- Arithmetic operations ($((...)))

### Professional Practices:

- Input validation & sanitization
- Error handling with exit codes
- Modular function design

### User Experience:

- ANSI color codes for readability
- Interactive prompts with read and select
- Progress feedback and error messages

## Educational Use

This project is ideal for:

- Bash scripting learners
- Primary/middle school multiplication drills
- System admin coding challenges
- Interactive CLI tool building

## Testing

### Automated Tests
```bash
# Verify full table generation
./multitable.sh <<< $'5\n1\nn' | grep "5 x 10 = 50" || echo "Test failed"

# Test error handling
./multitable.sh <<< $'abc\n5\n1\nn' | grep "Error" || echo "Test failed"
```

### CI Integration
<pre>
yaml
# .github/workflows/test.yml
jobs:
  test:
    steps:
      - uses: actions/checkout@v3
      - run: |
          ./multitable.sh <<< $'3\n1\nn' | grep "3 x 10 = 30"
          ./multitable.sh <<< $'x\n3\n2\n4\n8\nn' | grep "Invalid range"

</pre>

### Contributing
Pull requests, improvements, and feature suggestions are welcome. Please fork the repository and submit your changes via PR.

## License
MIT License - Free for modification and commercial use. See LICENSE for details.


