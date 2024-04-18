# frozen_string_literal: true

class PostBlueprint < Blueprinter::Base
    identifier :id

  fields :photo, :description, :location, :status

  view :normal do
    
    association :user, blueprint: UserBlueprint, view: :normal
end
