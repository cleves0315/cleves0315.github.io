<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        <li class="menu-item menu-item-{{ itemName | replace(' ', '-') }}">
          <a href="{{ url_for(trim(path.split('||')[0])) }}" rel="section">
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-fw fa-{{ path.split('||')[1] | trim | default('question-circle') }}"></i> <br />
            {% endif %}
            <span class="menu-item-name">{{ __('menu.' + name) | replace('menu.', '') }}</span>
          </a>
        </li>
      {% endfor %}

      {% if hasSearch %}
        <li class="menu-item menu-item-search">
          {% if theme.swiftype_key %}
            <a href="javascript:;" class="st-search-show-outputs">
          {% elseif theme.local_search.enable || theme.algolia_search.enable %}
            <a href="javascript:;" class="popup-trigger">
          {% endif %}
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
            {% endif %}
            {{ __('menu.search') }}
          </a>
        </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>

{% if siteBrand %}
  <div class="site-brand-wrapper">
    <img class="site-brand-back-img" src="{{ url_for( theme.header_site_brand ) }}" />
    <div class="brand">
      <div class="site-title">
        <span>{{ config.title }}</span>
      </div>
    </div>
    <div class="site-master">
      <div class="site-master-frame">
        <img class="site-master-img" src="{{ url_for( theme.avatar) }}" />
      </div>
    </div>
  </div>
{% endif %}

{% include '../_custom/header.swig' %}
