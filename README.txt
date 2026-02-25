Name: Shrinidhi  
Course: Cybersecurity - Bash Scripting Automation Assignment  

Overview:
This assignment consists of five Bash scripts that demonstrate system information retrieval,
file and directory management, log analysis, automated backups, and user account reporting.
All scripts were developed and tested in a Kali Linux environment.


Files Included:
q1_system_info.sh      - Displays formatted system information.
q2_file_manager.sh     - Menu-driven file and directory manager.
q3_log_analyzer.sh     - Analyzes web server log file and generates statistics.
q4_backup.sh           - Creates automated backups (simple copy or compressed).
q5_user_report.sh      - Generates user statistics and security report.

How to Run:

1. Make scripts executable (if not already):
   chmod +x *.sh

2. Run individual scripts:

Q1 - System Information:
   ./q1_system_info.sh

Q2 - File Manager:
   ./q2_file_manager.sh

Q3 - Log Analyzer:
   ./q3_log_analyzer.sh access.log

Q4 - Backup Script:
   ./q4_backup.sh

Q5 - User Report:
   sudo ./q5_user_report.sh

Environment:
Developed and tested on Kali Linux (Debian-based system).
All scripts are compatible with Ubuntu/Debian environments.

Challenges Faced:
- Correctly parsing log file fields using awk.
- Handling edge cases like empty files and invalid inputs.
- Formatting output alignment to match the sample output structure.
