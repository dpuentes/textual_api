class TranslatesController < ActionController::API
    attr_accessor :image
    def index
        render :json => {:success=>true, :message=>"Request ok"}, status: 200
    end

    def create
        #str = Base64.encode64(File.read("app/images/62.png"))
        
        s = Base64.decode64(params[:image])

        file_name = rand(1000)
        path = "tmp/#{rand}.png"

        File.open(path, 'wb') do |f|
            f.write(s)
        end
        image = RTesseract.new(path)
        puts image.to_s


        render :json => {:success=>true, :message=>"#{image.to_s}"}, status: 200
    end
end