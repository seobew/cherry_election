require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'

name = "이재명"
num = 0
#0 : 한겨레, 1 : 조선일보, 2 : 중앙일보, 3 : 동아일보, 4 : 경향신문, 5 : 서울신문, 6 : jtbc
post = 3

de_name = CGI::escape(name)

if post == 0
	one = Nokogiri::HTML(open("http://search.hani.co.kr/Search?command=query&keyword=#{de_name}&media=news&sort=d&period=all&datefrom=2000.01.01&dateto=2017.02.25&pageseq=#{num}"))
	t = one.xpath("//dt//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
	end
elsif post == 1
	one = Nokogiri::HTML(open("http://search.chosun.com/search/news.search?query=#{de_name}&pageno=#{num}&orderby=&naviarraystr=&kind=&cont1=&cont2=&cont5=&categoryname=&categoryd2=&c_scope=news&sdate=&edate=&premium="))
	t = one.xpath("//dt//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
	end
elsif post == 2
	one = Nokogiri::HTML(open("http://search.joins.com/JoongangNews?page=#{num}&Keyword=#{de_name}&SortType=New&SearchCategoryType=JoongangNews"))
	t = one.xpath("//strong[@class='headline mg']//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
	end
elsif post == 3
	donga_num = num * 15 + 1
	one = Nokogiri::HTML(open("http://news.donga.com/search?p=#{donga_num}&query=#{de_name}&check_news=1&more=1&sorting=1&search_date=1&v1=&v2=&range=1"))
	t = one.xpath("//p[@class='tit']//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
  end
elsif post == 4
	num = num + 1
	one = Nokogiri::HTML(open("http://search.khan.co.kr/search.html?stb=khan&q=#{de_name}&sort=1&pg=#{num}"))
	t = one.xpath("//dl[@class='phArtc']//dt//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
	end

end