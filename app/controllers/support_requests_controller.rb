class SupportRequestsController < ApplicationController
  def index
    @support_requests = SupportRequest.all
  end

  def update
    support_request = SupportRequest.find(params[:id])
    support_request.update(response: support_request_params[:response])
    SupportRequestMailer.respond(support_request).deliver_now
    redirect_to support_requests_path
  end

  private

    def support_request_params
      params.require(:support_request).permit(:response)
    end
end
