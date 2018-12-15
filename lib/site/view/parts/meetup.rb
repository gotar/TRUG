# auto_register: false

require "dry/view/part"

module Site
  module View
    module Parts
      class Meetup < Dry::View::Part
        def meetup_header(meetup)
          [].tap do |header|
            header.push("TRUG##{meetup.number}")
            header.push("(#{meetup.date})")
          end.join(" ")
        end

        def talk_title(talk)
          if talk[:slides]
            "<a href='#{talk[:slides]}' target='_blank'>#{talk[:title]}</a>"
          else
            talk[:title]
          end
        end

        def talk_speaker(talk)
          if talk[:home_page]
            "<a href='#{talk[:home_page]}' target='_blank'>#{talk[:fullname]}</a>"
          else
            talk[:fullname]
          end
        end

        def talk_source_code(talk)
          "Source code: <a href='#{talk[:source_code]}' target='_blank'>#{talk[:source_code]}</a>" if talk[:source_code]
        end
      end
    end
  end
end
