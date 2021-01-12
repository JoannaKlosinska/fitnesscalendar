require "rails_helper"

describe Coaches::SchedulesController, type: :controller do
  fixtures(:coaches)

  let(:coach) { coaches(:first) }
  let!(:schedule) { Schedule.create(coach: coach, monday: ["12"]) }

  describe "#update" do
    context "with valid attributes" do
      let(:valid_attributes) do
        {
          schedule: {
            monday: ["8", "11"]
          }
        }
      end
      
      it "updates the record" do
        sign_in(coach)
        patch(:update, params: valid_attributes)

        expect(schedule.reload.monday).to eq ["8", "11"]
      end

      it "redirects to #show" do
        sign_in(coach)
        patch(:update, params: valid_attributes)

        expect(:response).to redirect_to schedule_path
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) do
        {
          schedule: {
            monday: ["24"]
          }
        }
      end

      it "does not update the record" do
        sign_in(coach)
        patch(:update, params: invalid_attributes)

        expect(schedule.reload.monday).to eq ["12"]
      end

      it "render show with errors" do
        sign_in(coach)
        patch(:update, params: invalid_attributes)

        expect(:response).to render_template(:show)
      end
    end
  end
end