import "@hotwired/turbo-rails";
import "@hotwired/stimulus";
import "@hotwired/stimulus-loading";
import "@rails/ujs";
import "./controllers";

import * as Turbo from "@hotwired/turbo-rails";
import Rails from "@rails/ujs";

Turbo.start();
Rails.start();
