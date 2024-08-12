package com.wifi.publicwifilocator.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class BookmarkDto {
    private int bookmarkId;
    private String bookmarkGroupName;
    private String wifiName;
    private LocalDateTime regDate;
}
