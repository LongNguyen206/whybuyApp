json.extract! profile, :id, :user_id, :first_name, :last_name, :gender, :dob, :phone, :occupation, :description, :created_at, :updated_at
json.url profile_url(profile, format: :json)
