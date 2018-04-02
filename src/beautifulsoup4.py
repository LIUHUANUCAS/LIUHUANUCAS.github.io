#encoding=utf-8

from bs4 import BeautifulSoup 

html_doc = """
<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title"><b>The Dormouse's story2</b></p>

<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>

<p class="story">...</p>
"""

soup = BeautifulSoup(html_doc,'lxml')
# print soup.prettify()
print soup.title
print soup.title.name
print soup.title.string
print soup.title.parent.name
print soup.p
print soup.p.name
print soup.p.string
print soup.p['class']
print soup.a
print soup.a['class']
print soup.a['href']
print soup.a['id']
print soup.a.name
print soup.a.string
ac = soup.find_all('a')
for e in  ac:
    print e.string,e['id'],e['href'],e.get('href')
print type(ac),len(ac)
# 获取所有的文本内容
print soup.get_text()
print soup.body.p.b
print soup.body.p.b.string
print soup.body.p.b.name
print soup.body.p.b.attributes
print soup.body.contents
for e in soup.body.contents:
    print e
