require "xmlsimple"

class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :comments

  def self.import_posts
    doc = XmlSimple.xml_in("lib/xml/import.xml")
    if doc
      user=User.first #-- change this to specific logic using user roles

      doc["channel"][0]["item"].each do |item|
        if item["post_type"]==["post"]
          print "--- Processing post ---\n"
          begin
           if post=Post.create(user_id: user.id, body:item["encoded"][0].gsub("\n","<br/>"), title:item["title"][0], created_at:item["pubDate"][0].to_time )
            print " Title: #{item["title"][0]} \n"
            print " Date: #{item["pubDate"][0]} \n"
            print " Content: #{item["encoded"][0]} \n"
            print "-------\n"

            #--- add loop through comments to insert associated with post.id
            if item["comment"]
             begin
               item["comment"].each do |comment|
                comment_content = comment["comment_content"][0]
                comment_author = comment["comment_author"][0]
                comment_date = comment["comment_date"][0].to_time

                Comment.create(post_id:post.id, body:comment_content, display_name:comment_author, created_at: comment_date)
                print "  --- Comment added to post #{post.id} -- \n"
               end
             rescue
                print "--- Error importing comment ... \n"
             end
            end

           else
            print " -- ERROR importing post... \n"
           end
         rescue
            print " -- (!) ERROR importing post... \n"
         end
       end
      end
    end
  end
end
