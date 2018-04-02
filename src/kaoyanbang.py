#coding=utf-8

from bs4 import BeautifulSoup 
import urllib
import urllib2

def get_html(url):
    # page = urllib.urlopen(url)
    page = urllib2.urlopen(url)
    html = page.read()
    return html#.decode('utf-8')

url = 'http://blcu.bbs.kaoyan.com/'
url = 'https://github.com/LIUHUANUCAS/Go'
url = 'https://weibo.com/'
url = 'https://www.jianshu.com/'
url = 'http://blcu.bbs.kaoyan.com/'
html = get_html(url)
# print html
soup = BeautifulSoup(html,'lxml',from_encoding='utf-8')
# print soup.title.string
# divContent = soup.find_all(lambda x:x.has_attr('id') and x['id'] == 'threadlist')
queue = [url]
# queue = Queue()

def getContent_html(soup):

    table = soup.find(id= 'threadlisttableid')

    for row in table :
        if row is None or str(row).strip() == '':
            continue
        if row.tr is None :
            continue
        
        tr = row.tr
        tds = tr.contents
        first = 1
        for e in  tr.contents:
            newline = 0
            if str(e).strip() == '':
                continue
            
            if e.get('class') == ['common']:
                k = 0
                for line in  e.stripped_strings:
                    k += 1
                    if k == 2 :
                        print line,

            if e.get('class') == ['new']:
                newline = 1
                i = 0
                for ele in e.stripped_strings:
                    i += 1
                    if i == 2 or i == 4:
                        print ele,
                    if i >= 4:
                        break             
                for aname in e.find('a'):
                    print aname,
            if first == 1:
                if e.get('class') == ['by']:#zuozhe
                    if e.a is not None:
                        print e.a.string,
                    if e.em is not None and e.em.a is not None :
                        print e.em.a.string,
                    first = 2

            if e.get('class') == ['num']:#//zuihoude ren  作者，回复量
                if e.a is not None:
                    print e.a.get('href'),e.a.string,e.em.string,

            if first == 2:
                if e.get('class') == ['by']:#最后的回复者
                    newline = 1
                    if e.a is not None:
                        print e.a.string,
                    if e.em is not None and e.em.a is not None :
                        print '\'%s\'' % e.em.a.string
    next = soup.find(id = 'fd_page_top')
    for e in next:
        if e.get('class') == ['pg']:
            for a in  e.contents:
                if a.name == 'a':
                    # print type(a),a.name,a.get('href'),a.string
                    queue.append(str(a.get('href')))
            # print e.a

# getContent_html(soup)
begin = 0
while len(queue) > 0:
    url = queue[0]
    queue = queue[1:]
    html = get_html(url)
    soup = BeautifulSoup(html,'lxml',from_encoding='utf-8')
    getContent_html(soup)
    begin += 1
    if begin > 10 :
        break
