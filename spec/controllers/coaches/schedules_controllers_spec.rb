require "rails_helper"

describe Coaches::SchedulesController do
  describe "#show" do
    it "shows current coach schedule" do
      coach = Coach.create
      schedule = coach.schedule
      visit schedule_path

      expect(page).to have_content(schedule)
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "redirects to updated schedule" do
        coach = Coach.create
        schedule = coach.schedule

        expect(response).to redirect_to(schedule_path)
      end
    end

    context "with invalid attributes" do
      it "render show" do
        coach = Coach.create
        schedule = coach.schedule
        visit '/coach/schedule'
        click_on 'Update'
        expect(page).to render_template(:show)
      end
    end
  end
end