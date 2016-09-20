abstract flash error messages out to helpers and use before_action


old probably no good conditional for points errors
    if factor_params[:points].to_i == 0 && factor_params[:points] != "0"
      flash[:alert] = "numbers only for point entry"
      @option = Option.find_by(id: factor_params[:option_id])
      redirect_to new_factor_path(option_id: @option.id, flash: true)
    else
    
    option_params[:factors_attributes].each do |num, hash|
      if hash[:points].to_i == 0 && hash[:points] != "0"
        flash[:error] = "numbers only for points entry"
        redirect_to new_option_path
      end
    end