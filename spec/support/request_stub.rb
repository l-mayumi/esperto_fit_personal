module RequestStub
  def cpf_status
    filename = 'cpf_status.json'
    url      = 'http://academy.com.br/api/v1/clients/consult_cpf/99999999999'
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))

    stub_request(:get, url).
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Faraday v0.17.0'
        }).
    to_return(status: 302, body: json_response, headers:  {'Content-Type': 'application/json'})
  end

  def cpf_status_inactive
    filename = 'cpf_inactive.json'
    url      = 'http://academy.com.br/api/v1/clients/consult_cpf/88888888888'
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))

    stub_request(:get, url).
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Faraday v0.17.0'
        }).
      to_return(status: 302, body: json_response, headers:  {'Content-Type': 'application/json'})
  end

  def cpf_status_empty
    filename = 'cpf_status.json'
    url      = 'http://academy.com.br/api/v1/clients/consult_cpf/12345678908'
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))

    stub_request(:get, url)
      .with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'User-Agent'=>'Faraday v0.17.0'
        }).
      to_return(status: 404, body: 'Não encontrado' , headers:  {})
  end

  def list_gyms
    filename = 'gyms.json'
    url      = 'http://academy.com.br/api/v1/gyms'
    json_response = JSON.parse(
      File.read(Rails.root.join('spec', 'support', "#{filename}")
    ), symbolize_names: true)
    
    stub_request(:get, url).
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v0.17.0'
          }).
      to_return(status: 200, body: '[{"id":1,"created_at":"2019-10-13T22:50:48.181Z","updated_at":"2019-10-13T22:50:48.810Z","name":"Academia Paulista","cod":1,"open_hour":"08:00","close_hour":"22:00","working_days":"segunda à sexta","address":"Av. Paulista, 123"},{"id":2,"created_at":"2019-10-13T22:50:48.277Z","updated_at":"2019-10-13T22:50:49.174Z","name":"Academia Consolação","cod":2,"open_hour":"08:00","close_hour":"22:00","working_days":"segunda à sexta","address":"Av. Consolação, 123"},{"id":3,"created_at":"2019-10-13T22:50:48.377Z","updated_at":"2019-10-13T22:50:49.530Z","name":"Academia Madalena","cod":3,"open_hour":"08:00","close_hour":"22:00","working_days":"segunda à sexta","address":"Av. Madalena, 123"}]')
  end

  def list_payments
    filename = 'payments.json'
    url      = 'http://0.0.0.0:5000/api/v1/payments/41370123850'
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))

    stub_request(:get, url)
      .to_return(status: 200, body: json_response, headers:  {'Content-Type': 'application/json'})
  end

  def list_plans(id)
    filename = 'plans.json'
    url      = "http://academy.com.br/api/v1/gyms/#{id}/plans"
    json_response = File.read(Rails.root.join('spec', 'support', "#{filename}"))
    stub_request(:get, url).
      to_return(status: 200, body: json_response, headers: {'Content-Type': 'application/json'})
  end

end
