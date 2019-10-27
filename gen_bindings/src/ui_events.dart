import 'package:dart_nvim_api/dart_nvim_api.dart';

/// Returns the corresponding event class, initialized with
/// `params`, for the [String] `eventName`. Assumes the length
/// of `params` is the same as that of the actual Neovim ui_event.
dynamic uiEvent(String eventName, List<dynamic> params) {
  switch (eventName) {
    {% for ui_event in ui_events %}
      case '{{ ui_event.name }}':
        return {{ to_pascal_case(ui_event.name) }}(
              {% for i in range(ui_event.parameters | length) %}
                params[{{ i }}],
              {% endfor %}
            );
    {% endfor %}
  }
}

{% for ui_event in ui_events %}
  {% set class_name = to_pascal_case(ui_event.name) %}
  class {{ class_name }} {
    {% for parameter in ui_event.parameters %}
      {{ parameter[0] }} {{ parameter[1] }};
    {% endfor %}

    {{ class_name }}(
        {% for parameter in ui_event.parameters %}
          this.{{ parameter[1] }},
        {% endfor %}
        );
  }
{% endfor %}
