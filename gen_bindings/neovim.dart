// Generated {{ date }} by `gen_bindings.py`.
// DO NOT MODIFY DIRECTLY!

import 'dart:async';
import 'package:meta/meta.dart';
import 'package:dart_nvim_api/session.dart';

{% for etype in exttypes %}
class {{ etype.name }} {
    dynamic _codeData;
    /// Internal value that represents the type.
    get codeData => _codeData;
    {{ etype.name }}(this._codeData);

    {% for f in functions if f.ext and f.name.startswith(etype.prefix) %}
    /// since: {{f.since}}
    Future<{{ f.return_type.native_type_ret }}> {{ f.name | capitalize | replace(etype.prefix, '') }}(Neovim neovim, {{ f.argstring }}) { 
        return neovim.session.call("{{f.name}}",
                          args: [_codeData
                          {% if f.parameters|count > 0 %}
                          , {{ f.parameters|map(attribute = "name")|join(", ") }}
                          {% endif %}
                          ]);
    }
    {% endfor %}
}

{% endfor %}

class Neovim {
  Session _session;
  get session => _session;

  Neovim.fromSession(this._session);
  Neovim.connectToRunningInstance({
    @required String host,
    @required int port,
  }) : _session = Session.fromRunningInstance(host: host, port: port);
  Neovim({String nvimBinaryPath})
      : _session = Session(nvim: nvimBinaryPath ?? '/usr/bin/nvim');

  {% for f in functions if not f.ext %}
    {% set trimmedFname = f.name | replace('nvim_', '') %}
    Future<{{ f.return_type.native_type_ret }}> {{ to_camel_case(trimmedFname) }}({{ f.argstring }}) async {
        var retVal = await _session.call("{{ f.name }}",
          args: [{{ make_args_from_params(f.parameters) | map(attribute = "name") | join(", ") }}]);

        {% if "Map" in f.return_type.native_type_ret or "List" in f.return_type.native_type_ret %}
          retVal = {{ f.return_type.native_type_ret }}.from(retVal);
        
        {% elif f.return_type.native_type_ret != "void" %}
          retVal = retVal as {{ f.return_type.native_type_ret }};
        {% endif %}

        return retVal;
    }

    {% endfor %}
}