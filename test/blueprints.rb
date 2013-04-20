require 'machinist/active_record'

Suggestion.blueprint do
  body { "This is the suggestion body" }
  title { "This is the title" }
  votes { 10 }
end

Comment.blueprint do
  body { "This is the comment body" }
end



# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end
