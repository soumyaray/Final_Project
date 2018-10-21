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

**Google path setting**
```
$ export GOOGLE_APPLICATION_CREDENTIALS= "config/google_credential.json"
```

**Search a picture with keyword**
```ruby
include SeoAssistant
a = Unsplash_API.new("dog")
b = a.get_picture.url
```
> <picture_link>

**Translate to English**
```ruby
include SeoAssistant
a = Translate.new("狗")
puts a.process
```
> "dog"
