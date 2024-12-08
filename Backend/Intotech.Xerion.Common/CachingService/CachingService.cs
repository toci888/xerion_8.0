﻿using Enyim.Caching.Memcached;
using Intotech.Xerion.Common.Interfaces.CachingService;

namespace Intotech.Xerion.Common.CachingService;

public class CachingService : ICachingService
{
    protected IMemcachedClient MemcacheClient;

    public CachingService()
    {
        MemcacheClient = MemcachedClient.GetClient();
    }
    public virtual bool Set<TCacheEntity>(string key, TCacheEntity cacheEntity)
    {
        if (MemcacheClient != null)
        {
            try
            {
                return MemcacheClient.SetAsync(key, cacheEntity).Result;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        return false;
    }

    public virtual TCacheEntity Get<TCacheEntity>(string key)
    {
        if (MemcacheClient != null)
        {
            return MemcacheClient.GetAsync<TCacheEntity>(key).Result;
        }

        return default(TCacheEntity);
    }

    public virtual bool Update<TCacheEntity>(string key, TCacheEntity cacheEntity)
    {
        if (MemcacheClient != null)
        {
            return MemcacheClient.ReplaceAsync(key, cacheEntity).Result;
        }

        return false;
    }

    public virtual bool Delete(string key)
    {
        if (MemcacheClient != null)
        {
            return MemcacheClient.DeleteAsync(key).Result;
        }

        return false;
    }
}