dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    properties {
        maxActive = 50
        maxIdle = 25
        minIdle =1
        initialSize = 1
        minEvictableIdleTimeMillis = 60000
        timeBetweenEvictionRunsMillis = 60000
        numTestsPerEvictionRun = 3
        maxWait = 10000
        testOnBorrow = true
        testWhileIdle = true
        testOnReturn = false
        validationQuery = "SELECT 1"
    }
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/hackathon?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = "pacte2013"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/hackathon?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = "pacte2013"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/hackathon?useUnicode=yes&characterEncoding=UTF-8"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = "pacte2013"
        }
    }
}