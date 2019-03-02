# Whiplash Batches Api

Whiplash Batches Api
## Get Started
```ruby
gem 'whiplash-batches-api'
```
create `config/initializer/whiplash_initializer.rb` file
```ruby
Whiplash.configure do |config|
  config.whiplash_email = WHIPLASH_EMAIL
  config.whiplash_password = WHIPLASH_PASSWORD
  config.whiplash_base_url = 'https://www.getwhiplash.com'
end
```
## Usage
``` ruby
handler = Whiplash::Batches::Api.new
```
### GET BATCHES
``` ruby
handler.batches
```
response is 
``` json
[{"batch": "437737",
  "to_pack": "2",
  "to_label": "2",
  "total_items": "51",
  "printed": "Mar 01, 2019  2:20PM",
  "pre_pack_buy": "",
  "assigned": "Start",
  "started": "",
  "stopped": "",
  "min": "",
  "incidents": "",
  "order_ids": ["7511027", "7515574"]},
  {"batch": "437732",
  "to_pack": "2",
  "to_label": "2",
  "total_items": "51",
  "printed": "Mar 01, 2019  2:20PM",
  "pre_pack_buy": "",
  "assigned": "Start",
  "started": "",
  "stopped": "",
  "min": "",
  "incidents": "",
  "order_ids": ["7511021", "7515575"]
  }
]
```

You can also add page number and ignore_list
1. if page number is given we fetch from given page number to end (ie if total pages we 10 and given page number is 7 then we return all batches from 7 to 10 pages)
2. If you want to ignore some batches add array of batch ids
``` ruby
  handler.batches(1, ["437737"])
```
It returns 
``` json
[
  {"batch": "437732",
  "to_pack": "2",
  "to_label": "2",
  "total_items": "51",
  "printed": "Mar 01, 2019  2:20PM",
  "pre_pack_buy": "",
  "assigned": "Start",
  "started": "",
  "stopped": "",
  "min": "",
  "incidents": "",
  "order_ids": ["7511021", "7515575"]
  }
]
```

### GET ORDERS
``` ruby
  handler.orders(437732)
```
it returns
``` json
["7511021", "7515575"]
```

# License

Copyright (c) 2018 Waqas Ali

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
