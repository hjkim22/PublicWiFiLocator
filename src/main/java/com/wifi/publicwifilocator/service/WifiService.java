package com.wifi.publicwifilocator.service;

import com.wifi.publicwifilocator.Pos;
import com.wifi.publicwifilocator.dto.WifiDto;
import com.wifi.publicwifilocator.entity.LocationHistory;
import com.wifi.publicwifilocator.repository.WifiRepository;

import java.util.ArrayList;

public class WifiService {
    WifiRepository wifiRepository = new WifiRepository();

    public boolean saveWifiData() {
        return wifiRepository.saveWifiData();
    }

    public ArrayList<WifiDto> getWifiList(Pos pos) {
        return wifiRepository.getWifiList(pos);
    }

    public WifiDto getWifi(String id) {
        return wifiRepository.getWifi(id);
    }

    public ArrayList<LocationHistory> getHistory() {
        return wifiRepository.getHistory();
    }

    public boolean removeHistory(int id) {
        return wifiRepository.deleteHistory(id);
    }

}
