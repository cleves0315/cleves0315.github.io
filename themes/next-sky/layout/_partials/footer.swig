<div class="run-time">该博客已经运行了<span id="since"></span></div>

<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy;{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="author" itemprop="copyrightHolder">{{ config.title }}.</span>
</div>

{% if theme.footer.powered %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}{#
#}.</div>
{% endif %}

<div>Theme By <a class="theme-link" href="https://github.com/cleves0315" target="_blank" class="external" rel="nofollow">Sky</a> v{{ theme.version }}.</div>
<div>Made with <i class="fa fa-heart" style="color: #d43f57;"></i> by {{ config.author }}.</div>
