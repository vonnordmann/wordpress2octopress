WordPress to Octopress
======================

This contains an [XSLT](http://en.wikipedia.org/wiki/XSLT) 2 stylesheet to convert [WordPress](http://wordpress.org/) blog posts (exported XML format) into [Octopress](http://octopress.org/) blog posts.

It's intended for sites with lots of posts, since the main value is generating rough versions of the blog post files themselves from the WordPress export. My blog has several dozen posts, and it was just too painful to have to copy/paste the posts from the WordPress dashboard to Octopress `rake new_post["..."]` files, so after about six posts I put this together.

Setup
-----

First, install [Saxon](http://saxon.sourceforge.net/) or some other XSLT processor. On Mac with Homebrew you can do `brew install saxon`.

To get the WordPress XML file, go to Dashboard &rarr; Tools &rarr; Export. Then drop that file in the wordpress2octopress root directory.

You will need to modify the `build` script since I have it hardcoded to build my own blog's export file. Just change the XML filename to yours. Also, if you aren't using Saxon, then you'll need to modify the command accordingly.

Running
-------

Once you do the setup, run `.\build`. The script will generate a bunch of Octopress blog posts in the _posts directory. You can copy those to your Octopress `sources/_posts` directory.

Limitations
-----------

I wrote this as a quick and dirty script to migrate my personal blog. So it does 80% of the work, but not everything.

* It doesn't convert your WordPress HTML to Markdown. Fortunately Octopress can display HTML, but if you want Markdown, you'll need to handle that yourself.
* It doesn't currently handle tags or comments. I'm planning to do those shortly as I have lots of tags and comments I need to migrate (plan to migrate the comments to [Disqus](http://disqus.com/)), but not doing it yet. [This](http://www.jotschi.de/2013/01/12/wordpress-to-jekyll.html) looks pretty promising though.
* It doesn't copy your images to new locations.
* It doesn't add `<!-- more -->` comments.

Happy to take pull requests if you have improvements.

End result
----------

As you can see, this script can save you a lot of time:

    ~/dev/git/wordpress2octopress$ ls -la _posts/
    total 1568
    drwxr-xr-x  84 williewheeler  staff   2856 Sep 19 00:22 .
    drwxr-xr-x  11 williewheeler  staff    374 Sep 19 00:21 ..
    -rw-r--r--   1 williewheeler  staff      0 Sep 18 22:39 .gitignore
    -rw-r--r--   1 williewheeler  staff   5859 Sep 19 00:22 2008-02-26-acegi-overview.markdown
    -rw-r--r--   1 williewheeler  staff  12680 Sep 19 00:22 2008-02-26-annotation-based-autowiring-in-spring-2-5.markdown
    -rw-r--r--   1 williewheeler  staff   5179 Sep 19 00:22 2008-02-26-annotation-based-mvc-in-spring-2-5.markdown
    -rw-r--r--   1 williewheeler  staff  19156 Sep 19 00:22 2008-02-29-web-services-with-spring-2-5-and-apache-cxf-2-0.markdown
    -rw-r--r--   1 williewheeler  staff  15912 Sep 19 00:22 2008-03-10-make-web-services-transparent-with-spring-2-5-and-apache-cxf-2-0.markdown
    -rw-r--r--   1 williewheeler  staff   7173 Sep 19 00:22 2008-03-13-how-to-recaptcha-your-java-application.markdown
    -rw-r--r--   1 williewheeler  staff  15335 Sep 19 00:22 2008-03-18-annotation-based-transactions-in-spring.markdown
    -rw-r--r--   1 williewheeler  staff   5344 Sep 19 00:22 2008-03-19-apachetomcat-integration.markdown
    -rw-r--r--   1 williewheeler  staff   3064 Sep 19 00:22 2008-03-19-setting-up-public-key-authentication-pka-over-ssh.markdown
    -rw-r--r--   1 williewheeler  staff   4022 Sep 19 00:22 2008-03-28-tutorial-wireshark-in-fifteen-minutes.markdown
    -rw-r--r--   1 williewheeler  staff  13009 Sep 19 00:22 2008-05-05-build-a-shopping-cart-with-spring-web-flow-2-part-1.markdown
    -rw-r--r--   1 williewheeler  staff   7187 Sep 19 00:22 2008-05-05-smtp-and-smtp-auth.markdown
    -rw-r--r--   1 williewheeler  staff  17197 Sep 19 00:22 2008-05-06-build-a-shopping-cart-with-spring-web-flow-2-part-2.markdown
    -rw-r--r--   1 williewheeler  staff  16735 Sep 19 00:22 2008-05-07-build-a-shopping-cart-with-spring-web-flow-2-part-3.markdown
    -rw-r--r--   1 williewheeler  staff   9860 Sep 19 00:22 2008-05-08-session-scoped-beans-in-spring.markdown
    -rw-r--r--   1 williewheeler  staff   8170 Sep 19 00:22 2008-05-15-send-e-mail-using-spring-and-javamail.markdown
    -rw-r--r--   1 williewheeler  staff  17425 Sep 19 00:22 2008-07-17-annotation-based-validation-with-the-spring-bean-validation-framework.markdown
    -rw-r--r--   1 williewheeler  staff   4412 Sep 19 00:22 2008-08-28-welcome-to-our-spring-in-practice-blog.markdown
    -rw-r--r--   1 williewheeler  staff   7168 Sep 19 00:22 2008-08-31-about-our-book.markdown
    -rw-r--r--   1 williewheeler  staff  20095 Sep 19 00:22 2008-08-31-storing-passwords-securely.markdown
    -rw-r--r--   1 williewheeler  staff    725 Sep 19 00:22 2008-09-05-just-got-the-book-cover.markdown
    -rw-r--r--   1 williewheeler  staff   4893 Sep 19 00:22 2008-09-06-login-remember-me.markdown
    -rw-r--r--   1 williewheeler  staff    839 Sep 19 00:22 2008-09-30-weve-been-meaped-chapters-4-5-available.markdown
    -rw-r--r--   1 williewheeler  staff   5583 Sep 19 00:22 2008-10-01-some-thoughts-on-the-new-springsource-maintenance-policy.markdown
    -rw-r--r--   1 williewheeler  staff  26515 Sep 19 00:22 2008-10-11-hashing-and-salting-passwords-with-spring-security-2.markdown
    -rw-r--r--   1 williewheeler  staff   9959 Sep 19 00:22 2008-10-13-concurrent-programming-for-practicing-software-engineers-part-1.markdown
    -rw-r--r--   1 williewheeler  staff  23072 Sep 19 00:22 2008-10-14-concurrent-programming-for-practicing-software-engineers-part-2.markdown
    -rw-r--r--   1 williewheeler  staff  13622 Sep 19 00:22 2008-10-15-concurrent-programming-for-practicing-software-engineers-part-3.markdown
    -rw-r--r--   1 williewheeler  staff   3644 Sep 19 00:22 2008-10-27-spring-paranoia-with-initializingbean-and-assert.markdown
    -rw-r--r--   1 williewheeler  staff  13218 Sep 19 00:22 2008-11-15-aop-101-speeding-up-springs-javamailsenderimpl-with-aop.markdown
    -rw-r--r--   1 williewheeler  staff  10320 Sep 19 00:22 2008-11-25-publish-an-rss-feed-with-spring-3-0.markdown
    -rw-r--r--   1 williewheeler  staff    312 Sep 19 00:22 2008-11-27-springone-americas-2008.markdown
    -rw-r--r--   1 williewheeler  staff  10646 Sep 19 00:22 2008-12-01-rod-johnsons-keynote-address-at-springone-americas-2008.markdown
    -rw-r--r--   1 williewheeler  staff   7359 Sep 19 00:22 2008-12-02-new-stuff-in-spring-30.markdown
    -rw-r--r--   1 williewheeler  staff   9586 Sep 19 00:22 2008-12-03-new-stuff-in-spring-30-part-2.markdown
    -rw-r--r--   1 williewheeler  staff  20606 Sep 19 00:22 2009-02-02-getting-started-with-hibernate-validator.markdown
    -rw-r--r--   1 williewheeler  staff   5032 Sep 19 00:22 2009-05-15-balancing-frontend-and-backend-server-capacity.markdown
    -rw-r--r--   1 williewheeler  staff  13941 Sep 19 00:22 2010-07-06-annotation-based-circuit-breakers-with-spring.markdown
    -rw-r--r--   1 williewheeler  staff   5961 Sep 19 00:22 2010-07-06-spring-security-database-schemas-for-mysql.markdown
    -rw-r--r--   1 williewheeler  staff   1154 Sep 19 00:22 2010-07-12-spring-security-3-dzone-refcard-and-interview.markdown
    -rw-r--r--   1 williewheeler  staff    398 Sep 19 00:22 2010-07-14-spring-roo-in-under-nine-minutes.markdown
    -rw-r--r--   1 williewheeler  staff   1801 Sep 19 00:22 2010-07-20-thoughts-on-cloud-portability.markdown
    -rw-r--r--   1 williewheeler  staff   9283 Sep 19 00:22 2010-07-27-top-ten-operational-excellence-design-principles.markdown
    -rw-r--r--   1 williewheeler  staff   1617 Sep 19 00:22 2010-09-06-quick-tip-upgrade-a-legacy-password-storage-scheme.markdown
    -rw-r--r--   1 williewheeler  staff   1532 Sep 19 00:22 2010-10-10-quick-tip-avoid-rule-duplication-when-using-securityauthorize.markdown
    -rw-r--r--   1 williewheeler  staff   3914 Sep 19 00:22 2010-10-27-quick-tip-spring-security-role-based-authorization-and-permissions.markdown
    -rw-r--r--   1 williewheeler  staff   3475 Sep 19 00:22 2010-10-28-springone-2gx-takeaways.markdown
    -rw-r--r--   1 williewheeler  staff   2022 Sep 19 00:22 2011-12-05-skybase-screenshots.markdown
    -rw-r--r--   1 williewheeler  staff   3663 Sep 19 00:22 2011-12-06-jackson-json-jaxb2-xml-spring.markdown
    -rw-r--r--   1 williewheeler  staff  14350 Sep 19 00:22 2011-12-06-why-im-pretty-excited-about-using-neo4j-for-a-cmdb-backend.markdown
    -rw-r--r--   1 williewheeler  staff  16868 Sep 19 00:22 2011-12-17-domain-modeling-with-spring-data-neo4j-code.markdown
    -rw-r--r--   1 williewheeler  staff   8743 Sep 19 00:22 2011-12-26-devops-how-not-to-collect-configuration-management-data.markdown
    -rw-r--r--   1 williewheeler  staff   1734 Sep 19 00:22 2011-12-28-initializing-lazy-loaded-collections-with-spring-data-neo4j.markdown
    -rw-r--r--   1 williewheeler  staff   4841 Sep 19 00:22 2011-12-29-its-back-the-classpathscanningjaxb2marshaller.markdown
    -rw-r--r--   1 williewheeler  staff  12537 Sep 19 00:22 2012-01-03-closed-loops-the-secret-to-collecting-configuration-management-data.markdown
    -rw-r--r--   1 williewheeler  staff  11876 Sep 19 00:22 2012-01-07-making-formselect-work-nicely-using-spring-3-formatters.markdown
    -rw-r--r--   1 williewheeler  staff   4945 Sep 19 00:22 2012-01-14-calling-the-github-api-using-springs-resttemplate.markdown
    -rw-r--r--   1 williewheeler  staff   2290 Sep 19 00:22 2012-01-14-skybasegithub-integration.markdown
    -rw-r--r--   1 williewheeler  staff   4257 Sep 19 00:22 2012-01-17-more-skybase-screenshots.markdown
    -rw-r--r--   1 williewheeler  staff   9911 Sep 19 00:22 2012-01-17-spring-social-github-revisiting-github-integration.markdown
    -rw-r--r--   1 williewheeler  staff   5194 Sep 19 00:22 2012-02-12-working-with-the-neo4j-shell.markdown
    -rw-r--r--   1 williewheeler  staff   5804 Sep 19 00:22 2012-02-22-supporting-xml-and-json-web-service-endpoints-in-spring-3-1-using-responsebody.markdown
    -rw-r--r--   1 williewheeler  staff  11928 Sep 19 00:22 2012-03-06-neo4j-1-6-1-cypher-query-examples-when-using-spring-data-neo4j-2-0.markdown
    -rw-r--r--   1 williewheeler  staff   8925 Sep 19 00:22 2012-03-06-using-spring-social-github-to-access-secured-github-data-code.markdown
    -rw-r--r--   1 williewheeler  staff   2542 Sep 19 00:22 2012-03-06-zkybase-now-supports-authorized-access-to-github-via-spring-social-github.markdown
    -rw-r--r--   1 williewheeler  staff   2014 Sep 19 00:22 2012-04-08-sending-cookies-with-resttemplate.markdown
    -rw-r--r--   1 williewheeler  staff  10651 Sep 19 00:22 2012-04-24-autogenerate-daos-and-queries-using-spring-data-jpa.markdown
    -rw-r--r--   1 williewheeler  staff   4353 Sep 19 00:22 2012-04-26-the-spring-constructor-namespace-and-some-deep-thoughts.markdown
    -rw-r--r--   1 williewheeler  staff   3147 Sep 19 00:22 2012-04-29-configuring-jetty-to-use-gmail-as-an-smtp-provider.markdown
    -rw-r--r--   1 williewheeler  staff   8263 Sep 19 00:22 2012-04-29-fixing-pkix-path-building-issues-when-using-javamail-and-smtp.markdown
    -rw-r--r--   1 williewheeler  staff   6015 Sep 19 00:22 2012-05-03-migrating-non-wordpress-blog-comments-into-wordpress.markdown
    -rw-r--r--   1 williewheeler  staff    293 Sep 19 00:22 2012-05-05-combined-my-two-blogs.markdown
    -rw-r--r--   1 williewheeler  staff   1640 Sep 19 00:22 2012-05-06-mavenizing-an-empty-github-project-in-eclipse.markdown
    -rw-r--r--   1 williewheeler  staff   4043 Sep 19 00:22 2012-05-07-springs-constructor-namespace-is-a-bad-idea.markdown
    -rw-r--r--   1 williewheeler  staff   6840 Sep 19 00:22 2012-05-11-pagination-and-sorting-with-spring-data-jpa.markdown
    -rw-r--r--   1 williewheeler  staff   1149 Sep 19 00:22 2012-05-12-injecting-a-file-from-the-classpath-into-a-bean.markdown
    -rw-r--r--   1 williewheeler  staff   2113 Sep 19 00:22 2012-05-13-how-to-run-javascript-from-java.markdown
    -rw-r--r--   1 williewheeler  staff    957 Sep 19 00:22 2012-06-30-pageable-custom-queries-with-spring-data-jpa.markdown
    -rw-r--r--   1 williewheeler  staff   4158 Sep 19 00:22 2012-12-09-renaming-node-classes-when-using-spring-data-neo4j.markdown
    -rw-r--r--   1 williewheeler  staff    479 Sep 19 00:22 2013-05-08-spring-in-practice-now-available.markdown
    -rw-r--r--   1 williewheeler  staff    367 Sep 19 00:22 2013-06-08-seajug-talk-on-spring-data-jpa-spring-data-rest-and-spring-hateoas.markdown
    ~/dev/git/wordpress2octopress$ 

Here's an example of an Octopress post it generated:

    ---
    layout: post
    title: "Sending cookies with RestTemplate"
    date: 2012-04-08 21:06:18
    comments: true
    categories: [Chapter 11 - CMDB, Chapter 13 - Integration, Quick Tips]
    ---
    Sometimes it is necessary to send cookies along with requests to a RESTful API. One such example is the JIRA 4.3 API, which requires sending the <code>JSESSIONID</code> to JIRA for session management and authentication purposes. REST purists point out that such usages are not properly RESTful (see <a href="http://blog.mikepearce.net/2010/08/24/cookies-and-the-restful-api/" target="_blank">http://blog.mikepearce.net/2010/08/24/cookies-and-the-restful-api/</a> for a good discussion), and indeed the <code>RestTemplate</code> doesn't directly support sending cookies.
    
    But in the real world, we need to make things work, and so in this quick post I'll show how to send cookies with <code>RestTemplate</code>.
    
    The first thing to bear in mind is that we implement cookies as HTTP headers: the service uses a <code>Set-Cookie</code> response header to tell the client to set a cookie, and the client uses the <code>Cookie</code> request header for subsequent requests. And <code>RestTemplate</code> certainly supports setting request headers.
    
    Here's how I'm pulling down an access-controlled RSS feed from JIRA 4.3:
    
    <pre>HttpHeaders requestHeaders = new HttpHeaders();
    requestHeaders.add("Cookie", "JSESSIONID=" + session.getValue());
    HttpEntity requestEntity = new HttpEntity(null, requestHeaders);
    ResponseEntity rssResponse = restTemplate.exchange(
        "https://jira.example.com/sr/jira.issueviews:searchrequest-xml/18107/SearchRequest-18107.xml?tempMax=1000",
        HttpMethod.GET,
        requestEntity,
        Rss.class);
    Rss rss = rssResponse.getBody();</pre>
    
    The trick here is to use the <code>RestTemplate</code>'s <code>exchange()</code> method, as this gives us more control over the request, including request headers. We just encode the cookie as a <code>JSESSIONID=[session ID]</code> request header and send it along.
    
    Have fun!
