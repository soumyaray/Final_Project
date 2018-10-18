Library usage:


include SeoAssistant
a = Unsplash_API.new("dog")
b = a.get_picture.url
> <picture_link>


include SeoAssistant
a = Translate.new("狗")
puts a.process
> "dog"