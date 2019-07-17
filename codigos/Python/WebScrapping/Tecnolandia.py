# coding=utf-8
import requests
from bs4 import BeautifulSoup

url_page = 'https://www.tecnolandia.com.py/'
page = requests.get(url_page).text 
soup = BeautifulSoup(page, "lxml")

divTag = soup.find_all("article", attrs={'class': 'product-miniature'})
producto = ""
precio = ""
for articulo in divTag:
    for producto_title in articulo.find('h3', attrs={'class': 'product-title'}):
        producto = producto_title.text
    for producto_precio in articulo.find('span', attrs={'class': 'price'}):
        precio = producto_precio
    print producto + " (" + precio + ")"