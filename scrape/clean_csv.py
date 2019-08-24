

## needs day/month/year/quarter to be stored out
with open('currently_scraping.txt','r') as cfile:
   for line in cfile:
      line_array = line.rstrip().split(',')
      y = line_array[0]
      m = line_array[1]
      d = line_array[2]
      q = line_array[3]

with open('log' + y + m + d + '.csv','r') as data_file:
   cid_dict = dict()
   i = 0
   for line in data_file:
      if i is 0:
         i += 1
         continue
      cid = line.rstrip().split(',')[4]
      try:
         cid_dict[cid] += 1
      except KeyError:
         cid_dict[cid] = 1
   with open('count_' + y + m + d + '.txt','w') as ofile:
      for x in cid_dict:
         ofile.write(str(x) + ',' + str(cid_dict[x]) + '\n')

