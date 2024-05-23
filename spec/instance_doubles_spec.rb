class CustomFields
  def return_custom_field
    {
      data:
    { customer_name: 'Microsoft', id: '456iflxx' }
    }
  end
end

RSpec.describe CustomFields do
  describe 'regular double' do
    it 'can implement any method' do
      custom_field = double(return_custom_field: 'Hello', extended_schema: true)
      expect(custom_field.return_custom_field).to eq('Hello')
    end
  end
  describe 'instance double' do
    it 'can only imnplement methods that are defined on the class' do
      #  this will fail because the extended_schema method does not exist
      #   custom_field = instance_double(CustomFields, return_custom_field: 'Hello', extended_schema: true)
      custom_field = instance_double(CustomFields, return_custom_field: 'Hello')
      expect(custom_field.return_custom_field).to eq('Hello')
    end
    it 'can use the allow method and only implement methods that are defined on the class' do
      custom_field = instance_double(CustomFields)
      allow(custom_field).to receive(:return_custom_field).with(no_args).and_return('Hello')
    end
  end
end
