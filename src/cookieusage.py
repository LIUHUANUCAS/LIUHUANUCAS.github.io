#coding=utf-8

from bs4 import BeautifulSoup 
import urllib
import urllib2
import sys
import socket
import cookielib
import requests

reload(sys)
sys.setdefaultencoding('utf-8')

socket.setdefaulttimeout(10)

url = 'https://www.jianshu.com/'
url = 'https://www.jianshu.com/p/df4f77261a42'
cookie = {}
raw_cookie = '_ga=GA1.2.787622675.1502193898; read_mode=day; default_font=font2; locale=zh-CN; Hm_lvt_0c0e9d9b1e7d617b3e6842e85b9fb068=1522504007,1522681550,1522681571,1522681606; remember_user_token=W1sxOTc0MzE5XSwiJDJhJDEwJGMyZDdXSnh3eno3RC9mU0kvUFVYRXUiLCIxNTIyOTMwODA3LjA3MTEyNzQiXQ%3D%3D--f3c21e9069a3b1e7a53557b485903b52200e9fbb; _m7e_session=6a9cdc463258627c76853bb1445764de; Hm_lpvt_0c0e9d9b1e7d617b3e6842e85b9fb068=1522930811; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%221974319%22%2C%22%24device_id%22%3A%2215f2e7e2fc53c5-028e42b3666fca-3b3e5906-1049088-15f2e7e2fc6415%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_referrer%22%3A%22%22%2C%22%24latest_referrer_host%22%3A%22%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_utm_source%22%3A%22desktop%22%2C%22%24latest_utm_medium%22%3A%22index-collections%22%7D%2C%22first_id%22%3A%2215f2e7e2fc53c5-028e42b3666fca-3b3e5906-1049088-15f2e7e2fc6415%22%7D'

for line in raw_cookie.split(';'):
    k,v = line.split('=',1)
    cookie[k] = v

page = requests.get(url,cookies=cookie)

soup = BeautifulSoup(page.text,'lxml')
print str(soup.get_text()).decode('utf-8')