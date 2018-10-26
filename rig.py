"""
  filename: rig.py
"""
import os
from urllib.parse import urlparse

import yaml

CONFIG = {}
with open('BROWSERS.yaml', 'r') as file:
    CONFIG = yaml.load(file)


def extract_ext(url):
    """Extract file extension from url"""
    parse = urlparse(url)
    _, ext = os.path.splitext(parse.path)
    return ext

def install_webdriver(from_url, browsername):
    """Install webdriver from given url."""
    ext = extract_ext(from_url)
    filename = '{}{}'.format(browsername, ext)
    os.system('curl {url} > {filename}'.format(url=from_url, filename=filename))

    if ext == '.zip':
        os.system('unzip {filename} -d /usr/bin/'.format(filename=filename))


BROWSERS = CONFIG.get('BROWSERS', {})
for browsername, install_urls in BROWSERS.items():
    driver_url = install_urls['driver']
    install_webdriver(driver_url, browsername)
