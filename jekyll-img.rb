module Jekyll
    class RenderImgTag < Liquid::Tag
        # text: url text
        def initialize(tag_name, text, tokens)
            super
            a = text.split " "
            @url = a.shift
            @caption = a.join " "
        end
        def render(context)
            site = context.registers[:site] 
            "<div style='text-align:center; margin-bottom: 15px;'>
                <img src='" +  site.config["imgurl"] + "/#{@url}' title=\"#{@caption}\" /><br />
                <i style='font-size: small;'>#{@caption}</i>
            </div>"
        end
    end
end
Liquid::Template.register_tag('img', Jekyll::RenderImgTag)
