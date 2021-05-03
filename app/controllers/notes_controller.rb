class NotesController < ApplicationController

	before_action :zaloginen

	def index
		#@note = Note.where(user_id: "#{current_user}")
		@note = current_user.note.all
	end

	def new
		@note = Note.new
	end

	def show
		@note = Note.find(params[:id])
	end

	def create
		@note = current_user.note.build(note_params)

		if @note.save
			redirect_to @note
		else
			render 'new'
		end
		#render plain: params[:post].inspect
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
	  @note = Note.find(params[:id])

	  if @note.update(note_params)
	    redirect_to @note
	  else
	    render 'edit'
	  end
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to @note
	end

	private def note_params
		params.require(:note).permit(:title, :body, :user_id)
	end
end
