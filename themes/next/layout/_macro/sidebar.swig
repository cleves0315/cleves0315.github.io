{% macro render(is_post) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    {% if theme.sidebar.onmobile %}
      <div id="sidebar-dimmer"></div>
    {% endif %}
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable or is_page and theme.toc.enable %}

      {% if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview-wrap">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview-wrap sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-overview">
          <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
            {% if theme.card_avatar %}
              <div class="site-author-image-wrap">
                <img class="site-author-image" itemprop="image"
                  src="{{ url_for( theme.card_avatar) }}"
                  alt="{{ theme.author }}" />
              </div>
            {% endif %}
              <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
              <p class="site-description motion-element" itemprop="description">{#
            #}{% if theme.seo %}{#
              #}{{ theme.signature }}{#
            #}{% else %}{#
              #}{{ theme.description }}{#
            #}{% endif %}{#
            #}</p>
          </div>

          <div class="site-state-title">能抓到我吗？</div>

          {#

            <nav class="site-state motion-element">

              {% if config.archive_dir != '/' and site.posts.length > 0 %}
                <div class="site-state-item site-state-posts">
                {% if theme.menu.archives %}
                  <a href="{{ url_for(theme.menu.archives).split('||')[0] | trim }}">
                {% else %}
                  <a href="{{ url_for(config.archive_dir) }}">
                {% endif %}
                    <span class="site-state-item-count">{{ site.posts.length }}</span>
                    <span class="site-state-item-name">{{ __('state.posts') }}</span>
                  </a>
                </div>
              {% endif %}

              {% if site.categories.length > 0 %}
                {% set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}
                {% set hasCategoriesPage = categoriesPageQuery.length > 0 %}
                <div class="site-state-item site-state-categories">
                  {% if hasCategoriesPage %}<a href="{{ url_for(categoriesPageQuery[0].path) }}">{% endif %}
                    <span class="site-state-item-count">{{ site.categories.length }}</span>
                    <span class="site-state-item-name">{{ __('state.categories') }}</span>
                  {% if hasCategoriesPage %}</a>{% endif %}
                </div>
              {% endif %}

              {% if site.tags.length > 0 %}
                {% set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}
                {% set hasTagsPage = tagsPageQuery.length > 0 %}
                <div class="site-state-item site-state-tags">
                  {% if hasTagsPage %}<a href="{{ url_for(tagsPageQuery[0].path) }}">{% endif %}
                    <span class="site-state-item-count">{{ site.tags.length }}</span>
                    <span class="site-state-item-name">{{ __('state.tags') }}</span>
                  {% if hasTagsPage %}</a>{% endif %}
                </div>
              {% endif %}

            </nav>

          #}

          {% if theme.rss %}
            <div class="feed-link motion-element">
              <a href="{{ url_for(theme.rss) }}" rel="alternate">
                <i class="fa fa-rss"></i>
                RSS
              </a>
            </div>
          {% endif %}

          {% if theme.social %}
            <div class="links-of-author motion-element">
              <span class="links-of-author-item">
                <a>
                  <svg t="1631295695346" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1637" width="30" height="30"><path d="M777.514667 131.669333a53.333333 53.333333 0 0 1 0 75.434667L728.746667 255.829333h49.92A160 160 0 0 1 938.666667 415.872v320a160 160 0 0 1-160 160H245.333333A160 160 0 0 1 85.333333 735.872v-320a160 160 0 0 1 160-160h49.749334L246.4 207.146667a53.333333 53.333333 0 1 1 75.392-75.434667l113.152 113.152c3.370667 3.370667 6.186667 7.04 8.448 10.965333h137.088c2.261333-3.925333 5.12-7.68 8.490667-11.008l113.109333-113.152a53.333333 53.333333 0 0 1 75.434667 0z m1.152 231.253334H245.333333a53.333333 53.333333 0 0 0-53.205333 49.365333l-0.128 4.010667v320c0 28.117333 21.76 51.157333 49.365333 53.162666l3.968 0.170667h533.333334a53.333333 53.333333 0 0 0 53.205333-49.365333l0.128-3.968v-320c0-29.44-23.893333-53.333333-53.333333-53.333334z m-426.666667 106.666666c29.44 0 53.333333 23.893333 53.333333 53.333334v53.333333a53.333333 53.333333 0 1 1-106.666666 0v-53.333333c0-29.44 23.893333-53.333333 53.333333-53.333334z m320 0c29.44 0 53.333333 23.893333 53.333333 53.333334v53.333333a53.333333 53.333333 0 1 1-106.666666 0v-53.333333c0-29.44 23.893333-53.333333 53.333333-53.333334z" p-id="1638" fill="#00c3ff"></path></svg>
                </a>
              </span>
              <span class="links-of-author-item">
                <a>
                  <svg t="1631296975137" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2597" width="30" height="30"><path d="M295.2 338c120.2 61 221.7 57.4 221.7 57.4s-38.5-134.8 80.5-194.6 200.9 41 200.9 41 20.8-5.7 36.2-11.4c15.5-5.7 37.8-15.9 37.8-15.9l-36.7 65.8 56.5-6s-7 10.2-29.6 31-31.9 31.6-31.9 31.6 8.1 162.3-77 287.2C668.5 749 558.6 824 398.9 839.8c-159.7 15.8-263.7-49.2-263.7-49.2s69.8-4 114.3-21.1S358 707.4 358 707.4s-91-28.1-123.7-59.8c-32.7-31.6-40.8-50.4-40.8-50.4l89.8-1.2s-94.5-50.4-121.3-90.3-30.3-78.5-30.3-78.5l69.1 28s-57.4-78.4-65.6-139.4c-8.2-61 10.5-93.8 10.5-93.8s29.3 55 149.5 116z" fill="#00c3ff" p-id="2598"></path></svg>
                </a>
              </span>
              <span class="links-of-author-item">
                <a>
                  <svg t="1631297025969" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3614" width="30" height="30"><path d="M512 42.666667A464.64 464.64 0 0 0 42.666667 502.186667 460.373333 460.373333 0 0 0 363.52 938.666667c23.466667 4.266667 32-9.813333 32-22.186667v-78.08c-130.56 27.733333-158.293333-61.44-158.293333-61.44a122.026667 122.026667 0 0 0-52.053334-67.413333c-42.666667-28.16 3.413333-27.733333 3.413334-27.733334a98.56 98.56 0 0 1 71.68 47.36 101.12 101.12 0 0 0 136.533333 37.973334 99.413333 99.413333 0 0 1 29.866667-61.44c-104.106667-11.52-213.333333-50.773333-213.333334-226.986667a177.066667 177.066667 0 0 1 47.36-124.16 161.28 161.28 0 0 1 4.693334-121.173333s39.68-12.373333 128 46.933333a455.68 455.68 0 0 1 234.666666 0c89.6-59.306667 128-46.933333 128-46.933333a161.28 161.28 0 0 1 4.693334 121.173333A177.066667 177.066667 0 0 1 810.666667 477.866667c0 176.64-110.08 215.466667-213.333334 226.986666a106.666667 106.666667 0 0 1 32 85.333334v125.866666c0 14.933333 8.533333 26.88 32 22.186667A460.8 460.8 0 0 0 981.333333 502.186667 464.64 464.64 0 0 0 512 42.666667" p-id="3615"></path></svg>
                </a>
              </span>
                {% for name, link in theme.social %}
                  <span class="links-of-author-item" style="display: none;">
                    <a href="{{ link.split('||')[0] | trim }}" target="_blank" title="{{ name }}">
                      {% if theme.social_icons.enable %}
                        <i class="fa fa-fw fa-{{ link.split('||')[1] | trim | default('globe') }}"></i>{#
                    #}{% endif %}{#
                      #}{% if not theme.social_icons.icons_only %}{#
                        #}{{ name }}{#
                      #}{% endif %}{#
                  #}</a>
                  </span>
                {% endfor %}
            </div>
          {% endif %}

          {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
          {% if theme.creative_commons in cc %}
            <div class="cc-license motion-element" itemprop="license">
              <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank">
                <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
              </a>
            </div>
          {% endif %}

          {# Blogroll #}
          {% if theme.links %}
            <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
              <div class="links-of-blogroll-title">
                <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
                {{ theme.links_title }}
              </div>
              <ul class="links-of-blogroll-list">
                {% for name, link in theme.links %}
                  <li class="links-of-blogroll-item">
                    <a href="{{ link }}" title="{{ name }}" target="_blank">{{ name }}</a>
                  </li>
                {% endfor %}
              </ul>
            </div>
          {% endif %}

          {% include '../_custom/sidebar.swig' %}
        </div>
      </section>

      {% if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}

      {% if theme.sidebar.b2t %}
        <div class="back-to-top">
          <img src="https://cdn.jsdelivr.net/gh/DIYgod/hexo-theme-sagiri/source/images/scroll.png">
          {% if theme.sidebar.scrollpercent %}
            <span id="scrollpercent"><span>0</span>%</span>
          {% endif %}
        </div>
      {% endif %}

    </div>
    {% if theme.scheme === 'Pisces' %}
      <footer id="footer" class="footer">
        <div class="footer-inner">
          {% include '../_partials/footer.swig' %}
          {% include '../_third-party/analytics/analytics-with-widget.swig' %}
          {% block footer %}{% endblock %}
        </div>
      </footer>
    {% endif %}
  </aside>
{% endmacro %}
