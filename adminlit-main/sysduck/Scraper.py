"""
This script scrapes the text from a list of URLs and writes it to a CSV file.
The output CSV file will have two columns: URL and Text.
"""

from typing import Generator
import requests
from bs4 import BeautifulSoup
import csv

urls: list[str] = [
    "https://<url>.com/",
    "https://<url>.com/about-us/",
    "https://<url>.com/industries/",
    # add the rest of your urls here
]

with open('output.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["URL", "Text"])

    for url in urls:
        response: requests.Response = requests.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # remove script and style elements
        for script in soup(["script", "style"]):
            script.decompose()

        text = soup.get_text()
        # break into lines and remove leading and trailing space on each
        lines: Generator[str, None, None] = (line.strip() for line in text.splitlines())
        # break multi-headlines into a line each
        chunks: Generator[str, None, None] = (phrase.strip() for line in lines for phrase in line.split("  "))
        # drop blank lines
        text: str = '\n'.join(chunk for chunk in chunks if chunk)
        
        writer.writerow([url, text])