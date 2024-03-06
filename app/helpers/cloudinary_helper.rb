module CloudinaryHelper
  require 'cloudinary'

  def telecharger_fichier_pdf(public_id, nom_fichier)
    # Configuration de Cloudinary
    # Cloudinary.config do |config|
    #   config.cloud_name = 'VOTRE_CLOUD_NAME'
    #   config.api_key = 'VOTRE_API_KEY'
    #   config.api_secret = 'VOTRE_API_SECRET'
    # end

    # Récupération de l'URL de téléchargement
    download_url = Cloudinary::Utils.download_zip_url(
      [public_id],
      :resource_type => 'raw',
      # :filename => nom_fichier
    )

    return download_url
  end
end
