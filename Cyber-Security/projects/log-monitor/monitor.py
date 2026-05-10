import time
import re
import argparse

# Dummy log for testing if file doesn't exist
DUMMY_LOG = "auth_test.log"

def monitor_log(log_path, threshold):
    print(f"[*] Monitoring {log_path} for brute force attempts (Threshold: {threshold})...")
    failed_attempts = {}

    try:
        with open(log_path, "r") as f:
            # Go to the end of the file
            f.seek(0, 2)
            
            while True:
                line = f.readline()
                if not line:
                    time.sleep(0.1)
                    continue
                
                # Simple regex for failed login patterns
                # Adjust based on your OS logs (e.g., 'Failed password for', 'Login failed')
                if "Failed password" in line or "authentication failure" in line:
                    ip_match = re.search(r'(\d{1,3}\.){3}\d{1,3}', line)
                    if ip_match:
                        ip = ip_match.group()
                        failed_attempts[ip] = failed_attempts.get(ip, 0) + 1
                        
                        print(f"[!] Failed attempt from {ip} (Total: {failed_attempts[ip]})")
                        
                        if failed_attempts[ip] >= int(threshold):
                            print(f"[🚨] ALERT: Potential Brute Force detected from {ip}!")
                            # Reset or take action here
                            failed_attempts[ip] = 0
                            
    except FileNotFoundError:
        print(f"[-] Error: {log_path} not found.")
    except KeyboardInterrupt:
        print("\n[*] Stopping monitor...")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-l", "--log", dest="log", help="Path to log file", default="auth.log")
    parser.add_argument("-t", "--threshold", dest="threshold", help="Failure threshold", default=5)
    args = parser.parse_args()
    
    monitor_log(args.log, args.threshold)
