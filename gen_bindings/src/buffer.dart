import 'package:dart_nvim_api/dart_nvim_api.dart';

{% for etype in exttypes %}
  {% if etype.name == "Buffer" %}
    class {{ etype.name }} {
        dynamic _codeData;
        /// Internal value that represents the type.
        get codeData => _codeData;
        {{ etype.name }}(this._codeData);

        {% for f in functions if f.ext and f.name.startswith(etype.prefix) %}
          {% set trimmedFname = f.name | replace('nvim_buf_', '') %}
        /// since: {{ f.since }}
        Future<{{ f.return_type.native_type_ret }}> {{
          to_camel_case(trimmedFname) }}(Neovim neovim, {{ f.argstring }}) async
          {
        {% set trimmedFname = f.name | replace('nvim_', '') %}
            var retVal = await neovim.session.call("{{f.name}}",
                              args: [_codeData
                              {% if f.parameters|count > 0 %}
                              , {{ f.parameters|map(attribute = "name")|join(", ") }}
                              {% endif %}
                              ]);

            {% if "Map" in f.return_type.native_type_ret or "List" in f.return_type.native_type_ret %}
              retVal = {{ f.return_type.native_type_ret }}.from(retVal);

            {% elif f.return_type.native_type_ret != "void" %}
              retVal = retVal as {{ f.return_type.native_type_ret }};
            {% endif %}

            return retVal;
        }
        {% endfor %}
    }
  {% endif %}
{% endfor %}
