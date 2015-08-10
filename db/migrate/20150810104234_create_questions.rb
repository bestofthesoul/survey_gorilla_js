class CreateQuestions < ActiveRecord::Migration
  def change
  	  create_table :questions do |t|
		t.string :description
		t.integer :survey_id
		      t.string :file
      t.timestamps null:false
    end
  end
end
