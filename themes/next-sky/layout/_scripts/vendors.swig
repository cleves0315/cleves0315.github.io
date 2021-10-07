{# Reset `window.Promise` when it was not a function. #}
{# IE refers the element whose id is `Promise` as `window.Promise`, this causes Velocity throwing an exception #}
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>

{% set css_vendors = {} %}
{% set css_vendors.nprogress_css = '' %}

{% for name, internal in css_vendors %}
  <link href="{{ theme.vendors[name] }}" rel="stylesheet" type="text/css" />
{% endfor %}

{% set js_vendors = {} %}
{% set js_vendors.jquery      = true %}
{% set js_vendors.fastclick   = true %}
{% set js_vendors.lazyload    = true %}
{% set js_vendors.velocity    = true %}
{% set js_vendors.velocity_ui = true %}
{% set js_vendors.pjax = true %}
{% set js_vendors.fancybox  = true %}
{% set js_vendors.nprogress  = true %}

{% for name, internal in js_vendors %}
  <script type="text/javascript" src="{{ theme.vendors[name] }}"></script>
{% endfor %}
