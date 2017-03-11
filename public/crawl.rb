require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'

name = "이재명"
num = 0
#0 : 한겨레, 1 : 조선일보, 2 : 중앙일보, 3 : 동아일보
post = 1

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
	one = Nokogiri::HTML(open("http://search.joins.com/News?Keyword=#{de_name}&SortType=New&SearchCategoryType=News&PeriodType=All&ScopeType=All&ImageType=All&JplusType=All&BlogType=All&ImageSearchType=Image&TotalCount=0&StartCount=0&IsChosung=False&IssueCategoryType=All&IsDuplicate=True&Page=#{num}&PageSize=3&IsNeedTotalCount=True"))
	t = one.xpath("//strong[class='headline mg']//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
  end
elsif post == 3
	one = Nokogiri::HTML(open("http://search.chosun.com/search/news.search?query=#{de_name}&pageno=#{num}&orderby=&naviarraystr=&kind=&cont1=&cont2=&cont5=&categoryname=&categoryd2=&c_scope=news&sdate=&edate=&premium="))
	t = one.xpath("//dt//a")
	t.each do |i|
		puts i.inner_text
		puts i['href']
	end

end