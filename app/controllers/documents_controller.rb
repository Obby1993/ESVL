class DocumentsController < ApplicationController
  include CloudinaryHelper
  def new
    @document = Document.new
  end

  # def create
  #     document = params[:document][:document]
  #     result = Cloudinary::Uploader.upload(document.tempfile, resource_type: :raw)

  #     Document.create(public_id: result['public_id'], année: params[:document][:année], titre: params[:document][:titre])


  #     redirect_to saison_path, notice: 'Le fichier PDF a été téléchargé avec succès.'
  # end


  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document, notice: 'Le document a été créé avec succès.'
    else
      render :new
    end
  end



    # @document = Document.new(document_params, public_id: result['public_id'])

    # if @document.save!
    #   redirect_to saison_path, notice: 'Le fichier PDF a été téléchargé avec succès.'
    # else
    #   render :new, status: :unprocessable_entity
    # end












  def destroy
    @document = Document.find(params[:id].to_i)
    @document.destroy
    redirect_to saison_path, status: :see_other
  end

  private

  def document_params
    params.require(:document).permit(:titre, :année, :document)
  end
end
