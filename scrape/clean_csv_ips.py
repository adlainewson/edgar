

## needs day/month/year/quarter to be stored out
with open('currently_scraping.txt','r') as cfile:
   for line in cfile:
      line_array = line.rstrip().split(',')
      y = line_array[0]
      m = line_array[1]
      d = line_array[2]
      q = line_array[3]

with open('log' + y + m + d + '.csv','r') as data_file:
   ip_dict = dict()
   i = 0
   for line in data_file:
      if i is 0:
         i += 1
         continue
      full_ip = line.rstrip().split(',')[0]
      ip = '.'.join(x for x in full_ip.split('.')[:-1])

      try:
         ip_dict[ip] += 1
      except KeyError:
         ip_dict[ip] = 1
   with open('ip_count_' + y + m + d + '.txt','w') as ofile:
      for x in ip_dict:
         ip_array = x.split('.')[:-1]
         ofile.write(str(x) + ',' + str(ip_dict[x]) + '\n')

