class PagesController < ApplicationController


  def home
    @messages= Message.all
  end
  def chat_room
    @room=ChatRoom.new
  end
  def rooms
    if(params.has_key?(:search))
      @rooms=ChatRoom.all.where("title like '%"+params[:search]+"%'")
    else
      @rooms=ChatRoom.all
    end
  end
  def chat_room
    @room=ChatRoom.find_by(:id=>params[:id])
    @message=Message.new
    
    # @current_user=User.find_by(:id=>current_user.id)
    
      if(params.has_key?(:message))
        @message=Message.new
        @message.body=params[:message]
        @message.user=current_user
        @message.chat_room=@room
        @message.save
      end
    
  end
  def new_room
    @room = ChatRoom.new
    @room.title=params[:title]
    @room.user_id=@current_user.__id__
    respond_to do |format|
      if @room.save
        format.html { redirect_to "/chat_room?id=#{@room.id}", notice: 'Room was successfully created.' }
        format.json { render :rooms, status: :created, location: @room }
      else
        format.html { render :new_room }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:title)
  end
end
