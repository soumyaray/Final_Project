# S&S_SeoAssistant
Application that allows users know keyword in any article and offer them pictures of each keyword.

## Overview
SeoAssistant can take the Chinese article pasted by user and analysize by using Google Cloud Natural Language API, which will come out "Entities" as the keyword of article.

Then, SeoAssistant will use Google Translaton API to translate keywords from Chinese to English in order to search the picture online.

Finally, SeoAssistant will pull the link of pictures which are online and have no copyright to anyone from Unsplash API.

We hope this application can help some content designer more easier to understand other article and generate attractive picture to make a report or article.

Here are the links of APIs we use:
[Unsplash Developers,](https://unsplash.com/developers)
[Cloud Natural Langrage,](https://cloud.google.com/natural-language/docs/quickstart-client-libraries#client-libraries-usage-ruby)
[Cloud Translation](https://cloud.google.com/translate/docs/quickstart-client-libraries)

## Usability goals
* Analysize the article and generate the keywords
* Translate the keywords
* Search pictures with keywords
* Display keywords and pictures in disigned layout.

## Usage:

**Installation**
```
$ bundle install
```

**Search a picture with keyword**
```ruby
require 'yaml'
CONFIG = YAML.safe_load(File.read('../../../config/secrets.yml'))
UNSPLASH_ACCESS_KEY = CONFIG['UNSPLASH_ACCESS_KEY']
search_pic = SeoAssistant::OutAPI::Unsplash.new(UNSPLASH_ACCESS_KEY, "dog")
puts search_pic.process['results'][0]['urls']['raw'] #string
```
> <dog_picture_first_url>

**Translate to English**
```ruby
include SeoAssistant::OutAPI
translate_word = Translate.new("狗,貓,公車")
puts translate_word.process #string
```
> "Dog, cat, bus"

**Analyze text**
```ruby
include SeoAssistant::OutAPI
text = "Google, headquartered in Mountain View, unveiled the new Android phone at the Consumer Electronic Show./
            Sundar Pichai said in his keynote that users love their new Android phones."
analyze_text = Analyze.new(text)
puts analyze_text.process.keyword #array
puts analyze_text.process.type #array
puts analyze_text.process.importance #array
```
> Google   users   phone   Android   Sundar Pichai   Mountain View   Consumer Electronic Show   phones   keynote

> ORGANIZATION   PERSON   CONSUMER_GOOD   CONSUMER_GOOD   PERSON   LOCATION   EVENT   CONSUMER_GOOD   OTHER

> 0.22637900710105896   0.191544771194458   0.18347220122814178   0.09827315807342529   0.09172182530164719   0.07637178152799606   0.05269023776054382   0.052234947681427   0.027312073856592


**Overall usage**
```ruby
require 'yaml'
script = SeoAssistant::OutAPI::ScriptMapper.new(GOOGLE_CONFIG, UNSPLASH_ACCESS_KEY).process("狗是最好的朋友")
puts script.each_keyword #array
puts script.num_keyword
puts script.keywords[0].urls.random_1_pic #string
```
> "狗"
> "朋友"
> 2
> <dog_picture_random_url>