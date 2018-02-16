#!/usr/bin/env python

#######################################################################################
# Autor: josego
# Blog: proyectosbeta.net
# Fecha creacion: 	15 de febrero de 2018 a las 21:09 hs.
# Fecha modificacion:	---------------------
# Script original: https://gist.github.com/DusanMadar/8f094ef647a0ad54cff1
# 
# Descarga la ultima version del edito atom y luego lo instala.
#
# Obs:
# - La descarga lo hace en el home del usuario actual y en la carpeta Descargas.

# Modo de uso:
# sudo python update_atom.py 
#######################################################################################

"""
Just a simple script to install the latest version of the Atom Editor
"""


import os
import sys
import requests
import subprocess

from bs4 import BeautifulSoup


DOWNLOAD_FILE = 'atom-amd64.deb'
DOWNLOAD_PATH = '{home}/Descargas'.format(home=os.path.expanduser('~'))
DONWLOAD_URL = 'https://atom.io/download/deb'
LATEST_RELEASE_URL = 'https://github.com/atom/atom/releases/latest'


# silence SSL certificate warnings
requests.packages.urllib3.disable_warnings()


def get_latest_version_number():
    """
    Get the version number for the latest Atom release
    return: str
    """
    response = requests.get(url=LATEST_RELEASE_URL, verify=False)

    soup = BeautifulSoup(response.content, 'html.parser')
    release_header = soup.find('h1', {'class': 'release-title'})

    return str(release_header.text)


def get_installed_version_number():
    """
    Get the version number of currently installed Atom
    return: str
    """
    versions = subprocess.check_output(['atom', '--version'])
    versions_parts = versions.split('\n')
    atom_info = versions_parts[0]
    atom_version = atom_info.split(': ')[-1]

    return str(atom_version)


def should_update():
    """
    Compare latest and installed version numbers and advice update
    return: bool
    """
    latest = [int(n) for n in get_latest_version_number().split('.')]
    installed = [int(n) for n in get_installed_version_number().split('.')]

    return latest > installed


def update_atom():
    """
    Download and install the latest Atom release
    """
    os.chdir(DOWNLOAD_PATH)
    subprocess.check_call(['wget', DONWLOAD_URL, '-O', DOWNLOAD_FILE])
    subprocess.check_call(['sudo', 'dpkg', '--install', DOWNLOAD_FILE])
    subprocess.check_call(['rm', '-rf', DOWNLOAD_FILE])


if __name__ == '__main__':
    if os.geteuid() != 0:
        sys.exit('Need to be root, exiting ...')

    if should_update():
        update_atom()
    else:
	sys.exit('No need to update, exiting ...')
