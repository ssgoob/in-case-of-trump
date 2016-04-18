class InternationalsController < ApplicationController
  def index
    @internationals = User.all.select {|user| user.status == 'International'}
  end
end
