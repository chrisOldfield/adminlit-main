import subprocess
import subprocess
import subprocess

def capture_and_analyze():
    """
    Starts a Wireshark capture and analyzes the captured traffic for suspicious packages.
    The capture filter is set to only show HTTP and HTTPS traffic, and the display filter is set to only show packages containing the word "suspicious".
    """


    p = subprocess.Popen(["wireshark", "-k", "-i", "1"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)

    if p.poll() is None:
        # Set the capture filter to only show HTTP and HTTPS traffic
        p = subprocess.Popen(["wireshark", "-k", "-i", "1"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)

        if p.poll() is None:
            p = subprocess.Popen(["wireshark", "-k", "-i", "1"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)

            # Set the capture filter to only show HTTP and HTTPS traffic
            if p.stdin:
                p.stdin.write("http or https\n")
                p.stdin.flush()

            # Start the display filter to only show suspicious packages
            if p.stdin:
                p.stdin.write("frame contains \"suspicious\"\n")
                p.stdin.flush()

            # Wait for the capture to finish
            p.wait()

            # Check the output for suspicious packages
            output: str = p.stdout.read() if p.stdout else ""

            if "suspicious" in output:
                print("Suspicious packages detected!")
            else:
                print("No suspicious packages detected.")
        else:
            print("Failed to start the subprocess.")
            output = ""
        if "suspicious" in output:
            print("Suspicious packages detected!")
        else:
            print("No suspicious packages detected.")
    else:
        print("Failed to start the subprocess.")
