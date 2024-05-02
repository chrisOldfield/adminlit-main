import subprocess

SUSPICIOUS_KEYWORD = b"suspicious"
WIRESHARK_INTERFACE = "1"
WIRESHARK_COMMAND = ["wireshark", "-k", "-i", WIRESHARK_INTERFACE]


def start_wireshark_capture():
	return subprocess.Popen(WIRESHARK_COMMAND, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


def set_filters(process, filter_string):
	process.stdin.write(filter_string)
	process.stdin.write(SUSPICIOUS_KEYWORD + b"\n")


def stop_capture(process):
	process.wait()
	process.terminate()


def check_for_suspicious_packets(process):
	output = process.stdout.read()
	if SUSPICIOUS_KEYWORD in output:
		print("Suspicious packages detected!")
	else:
		print("No suspicious packages detected.")


def analyze_network_traffic(filter_string):
	process = start_wireshark_capture()
	set_filters(process, filter_string)
	stop_capture(process)
	check_for_suspicious_packets(process)


analyze_network_traffic(b"http or https\n")
