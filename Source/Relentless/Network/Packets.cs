using Relentless.Global;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class DefaultMessage
    {
        public string msg = "";
    }

    public class ActiveResources
    {
        public string msg = "ActiveResources";
        public List<string> types = new List<string>();
    }

    public class AvatarSave
    {
        public string msg = "AvatarSave";
        public int head;
        public int body;
        public int leg;
        public int armBack;
        public int armFront;
    }

    public class AvatarTypes
    {
        public string msg = "AvatarTypes";
        public List<AvatarType> types = new List<AvatarType>();
    }

    public class BattleRedirect
    {
        public string msg = "BattleRedirect";
        public string ip;
        public int port;
    }

    public class BattleSignIn
    {
        public string msg = "BattleSignIn";
        public string email;
        public string password;
    }

    public class BuyStoreItem
    {
        public string msg = "BuyStoreItem";
        public int itemId;
        public bool payWithShards;
    }

    public class BuyStoreItemResponse
    {
        public string msg = "BuyStoreItemResponse";
        public List<Card> cards;
    }

    public class CardInfo
    {
        public string msg = "CardInfo";
        public Card card;
        public bool hasEnoughResources;
        public bool isPlayable;
        public Data data = new Data();
        public List<string> alerts = new List<string>();

        public class Data
        {
            public SelectableTiles selectableTiles = new SelectableTiles();
            public string targetArea;

            public class SelectableTiles
            {
                public List<List<TileSet>> tileSets = new List<List<TileSet>>();

                public class TileSet
                {
                    public string color;
                    public string position;
                }
            }
        }
    }

    public class CardTypes
    {
        public string msg = "CardTypes";
        public List<CardType> cardTypes = new List<CardType>();

        public class CardType
        {
            public int id;
            public string kind;
            public string name;
            public string description;
            public string flavor;
            public string subTypesStr;
            public int rarity;
            public int hp;
            public int ap;
            public int ac;
            public int costDecay;
            public int costOrder;
            public int costGrowth;
            public int costEnergy;
            public List<string> rulesList;
            public int cardImage;
            public int animationPreviewImage;
            public string animationPreviewInfo;
            public int animationBundle;
            public List<Ability> abilities;
            public string targetArea;
            public List<PassiveRule> passiveRules;
            public bool available;
            public string sound;
            public string soundProjectile;

            public class Ability
            {
                public string id;
                public string name;
                public string description;
                public Cost cost = new Cost();

                public class Cost
                {
                    public int DECAY;
                    public int ORDER;
                    public int ENERGY;
                    public int GROWTH;
                }
            }

            public class PassiveRule
            {
                public string displayName;
                public string description;
            }
        }
    }

    public class DeckCards
    {
        public string msg = "DeckCards";
        public string deck;
        public string metadata;
        public List<Card> cards = new List<Card>();
        public List<string> resources = new List<string>();
        public bool valid;
    }

    public class DeckDelete
    {
        public string msg = "DeckDelete";
        public string name;
    }

    public class DeckList
    {
        public string msg = "DeckList";
        public List<Deck> decks = new List<Deck>();

        public class Deck
        {
            public string name;
            public string resources;
            public bool valid;
            public string updated;
            public long timestamp;
        }
    }

    public class DeckSave
    {
        public string msg = "DeckSave";
        public string name;
        public string metadata;
        public List<int> cards;
    }

    public class DeckValidate
    {
        public string msg = "DeckValidate";
        public List<int> cards;
        public List<Error> errors;

        public class Error
        {
            public string msg;
        }
    }

    public class EndPhase
    {
        public string msg = "EndPhase";
        public string phase;
    }

    public class FailMessage
    {
        public string msg = "Fail";
        public string info;
        public string op;
    }

    public class GameChallenge
    {
        public string msg = "GameChallenge";
        public User from = new User();

        public class User
        {
            public string id;
            public string userUuid;
            public string name;
            public bool acceptChallenges;
            public bool acceptTrades;
            public string adminRole;
            public string userType;
        }
    }

    public class GameChallengeAccept
    {
        public string msg = "GameChallengeAccept";
        public string profile;
        public string deck;
    }

    public class GameChallengeDecline
    {
        public string msg = "GameChallengeDecline";
        public string profile;
    }

    public class GameChallengeResponse
    {
        public string msg = "GameChallengeResponse";
        public string status;
        public User to = new User();
        public User from = new User();

        public class User
        {
            public string id;
            public string userUuid;
            public string name;
            public bool acceptChallenges;
            public bool acceptTrades;
            public string adminRole;
            public string userType;
        }
    }

    public class GameChallengeRequest
    {
        public string msg = "GameChallengeRequest";
        public string profile;
        public string deck;
    }

    public class GameChatMessage
    {
        public string msg = "GameChatMessage";
        public string from;
        public string text;
    }

    public class GameInfo
    {
        public string msg = "GameInfo";
        public string white;
        public string black;
        public string gameType;
        public int gameId;
        public string color;
        public string deck;
        public int roundTimerSeconds;
        public string phase;
        public int rewardForIdolKill;
        public string nodeId;
        public int port;
        public Avatar whiteAvatar = new Avatar();
        public Avatar blackAvatar = new Avatar();

        public class Avatar
        {
            public string profileId;
            public int head;
            public int body;
            public int leg;
            public int armBack;
            public int armFront;
        }
    }

    public class GetStoreItems
    {
        public string msg = "GetStoreItems";
        public List<int> cardSellbackGold = new List<int>();
        public List<StoreItem> items = new List<StoreItem>();
    }

    public class GetTowerInfo
    {
        public string msg = "GetTowerInfo";
        public List<Level> levels = new List<Level>();

        public class Level
        {
            public int id;
            public string name;
            public int goldReward;
            public string description;
            public string difficulty;
            public string flavour;
            public bool isComplete;
        }
    }

    public class LibraryView
    {
        public string msg = "LibraryView";
        public string profileId;
        public List<Card> cards = new List<Card>();
    }

    public class LobbyLookup
    {
        public string msg = "LobbyLookup";
        public string ip;
        public int port;
    }

    public class NewEffects
    {
        public string msg = "NewEffects";
        public List<Effect> effects = new List<Effect>();

        public class Effect
        {
            public CardPlayedEffect CardPlayed;
            public CardSacrificedEffect CardSacrificed;
            public DamageIdolEffect DamageIdol;
            public DamageUnitEffect DamageUnit;
            public EndGameEffect EndGame;
            public HandUpdateEffect HandUpdate;
            public IdolUpdateEffect IdolUpdate;
            public RemoveUnitEffect RemoveUnit;
            public ResourcesUpdateEffect ResourcesUpdate;
            public StatsUpdateEffect StatsUpdate;
            public SummonUnitEffect SummonUnit;
            public SurrenderEffectEffect SurrenderEffect;
            public TurnBeginEffect TurnBegin;
            public UnitAttackDoneEffect UnitAttackDone;
            public UnitAttackIdolEffect UnitAttackIdol;
            public UnitAttackTileEffect UnitAttackTile;

            public class CardPlayedEffect
            {
                public string color;
                public Card card;
                public Target tile1;
            }

            public class CardSacrificedEffect
            {
                public string color;
                public string resource;
            }

            public class DamageIdolEffect
            {
                public Idol idol;
                public int amount;
                public bool kill;
            }

            public class DamageUnitEffect
            {
                public Target targetTile;
                public int amount;
                public int hp;
                public bool kill;
                public string attackType;
                public string damageType;
            }

            public class EndGameEffect
            {
                public string winner;
                public Stats whiteStats = new Stats();
                public Stats blackStats = new Stats();
                public GoldStats whiteGoldReward = new GoldStats();
                public GoldStats blackGoldReward = new GoldStats();

                public class Stats
                {
                    public string profileId;
                    public int idolDamage;
                    public int unitDamage;
                    public int unitsPlayed;
                    public int spellsPlayed;
                    public int enchantmentsPlayed;
                    public int scrollsDrawn;
                    public int totalMs;
                    public int mostDamageUnit;
                    public int idolsDestroyed;
                }

                public class GoldStats
                {
                    public int matchReward;
                    public int matchCompletionReward;
                    public int idolsDestroyedReward;
                    public int totalReward;
                }
            }

            public class HandUpdateEffect
            {
                public string profileId;
                public List<Card> cards = new List<Card>();
            }

            public class Idol
            {
                public string color;
                public int position;
                public int hp;
            }

            public class IdolUpdateEffect
            {
                public Idol idol;
            }

            public class RemoveUnitEffect
            {
                public Target tile;
                public string removalType;
            }

            public class ResourcesUpdateEffect
            {
                public Assets whiteAssets = new Assets();
                public Assets blackAssets = new Assets();

                public class Assets
                {
                    public Resources availableResources = new Resources();
                    public Resources outputResources = new Resources();
                    public int handSize;

                    public class Resources
                    {
                        public int DECAY;
                        public int ENERGY;
                        public int GROWTH;
                        public int ORDER;
                    }
                }
            }

            public class StatsUpdateEffect
            {
                public Target target;
                public int hp;
                public int ap;
                public int ac;
            }

            public class SummonUnitEffect
            {
                public Target target;
                public Card card;
            }

            public class SurrenderEffectEffect
            {
                public string color;
            }

            public class Target
            {
                public string color;
                public string position;
            }

            public class TurnBeginEffect
            {
                public string color;
                public int turn;
            }

            public class UnitAttackDoneEffect
            {
                public Target source;
            }

            public class UnitAttackIdolEffect
            {
                public Target attacker;
                public int idol;
            }

            public class UnitAttackTileEffect
            {
                public Target source;
                public Target target;
            }
        }
    }

    public class OkMessage
    {
        public string msg = "Ok";
        public string op;
    }

    public class OverallStats
    {
        public string msg = "OverallStats";
        public string serverName;
        public int loginsLast24h;
        public int totalCards;
        public int totalGoldRewarded;
        public int totalSoldCards;
        public int nrOfProfiles;
        public List<string> topRanked = new List<string>();
    }

    public class PlayCard
    {
        public string msg = "PlayCard";
        public int card;
        public Data data = new Data();

        public class Data
        {
            public List<string> positions = new List<string>();
        }
    }

    public class PlayCardInfo
    {
        public string msg = "PlayCardInfo";
        public int card;
    }

    public class ProfileDataInfo
    {
        public string msg = "ProfileDataInfo";
        public ProfileData profileData = new ProfileData();

        public class ProfileData
        {
            public int gold;
            public int shards;
            public int rating;
            public int selectedPreconstructed;
        }
    }

    public class ProfileInfo
    {
        public string msg = "ProfileInfo";
        public Profile profile = new Profile();

        public class Profile
        {
            public string id;
            public string userUuid;
            public string name;
            public bool acceptChallenges;
            public bool acceptTrades;
            public string adminRole;
            public string userType;
        }

    }

    public class ProfilePageInfo
    {
        public string msg = "ProfilePageInfo";
        public string id;
        public string name;
        public int gold;
        public int rating;
        public int gamesPlayed;
        public int gamesWon;
        public int gamesSurrendered;
        public int ranking;
        public int scrollsCommon;
        public int scrollsUncommon;
        public int scrollsRare;
        public string lastGamePlayed;
        public Avatar avatar = new Avatar();
        public List<string> unlockedAvatarTypes = new List<string>();

        public class Avatar
        {
            public string profileId;
            public int head;
            public int body;
            public int leg;
            public int armBack;
            public int armFront;
        }
    }

    public class Reconnect
    {
        public string msg = "Reconnect";
        public string email;
        public string password;
    }

    public class RoomChatMessage
    {
        public string msg = "RoomChatMessage";
        public string roomName;
        public string text;
        public string from;
    }

    public class RoomEnter
    {
        public string msg = "RoomEnter";
        public string roomName;
    }

    public class RoomEnterFree
    {
        public string msg = "RoomEnterFree";
        public string roomName;
    }

    public class RoomEnterMulti
    {
        public string msg = "RoomEnterMulti";
        public List<string> roomNames;
    }

    public class RoomExit
    {
        public string msg = "RoomExit";
        public string roomName;
    }

    public class RoomInfo
    {
        public string msg = "RoomInfo";
        public string roomName;
        public bool reset;
        public List<PlayerInfo> updated;
        public List<PlayerInfo> removed;

        public class PlayerInfo
        {
            public string id;
            public string name;
            public bool acceptChallenges;
            public bool acceptTrades;
            public string adminRole;
        }
    }

    public class RoomsList
    {
        public string msg = "RoomsList";
        public List<Room> rooms = new List<Room>();

        public class Room
        {
            public RoomInfo room = new RoomInfo();
            public int numberOfUsers;
        }

        public class RoomInfo
        {
            public string name;
            public bool autoIncrement;
        }
    }

    public class SacrificeCard
    {
        public string msg = "SacrificeCard";
        public int card;
        public string resource;

    }

    public class SelectPreconstructed
    {
        public string msg = "SelectPreconstructed";
        public string resourceType;
    }

    public class SellCards
    {
        public string msg = "SellCards";
        public List<int> cardIds = new List<int>();
    }

    public class ServerInfo
    {
        public string msg = "ServerInfo";
        public string version;
        public string assetURL;
    }

    public class SignIn
    {
        public string msg = "SignIn";
        public string email;
        public string password;
    }

    public class TradeAccept
    {
        public string msg = "TradeAccept";
        public string inviter;
    }

    public class TradeAddCards
    {
        public string msg = "TradeAddCards";
        public List<int> cardIds = new List<int>();
    }

    public class TradeDeckInvalidationWarning
    {
        public string msg = "TradeDeckInvalidationWarning";
        public List<string> deckNames = new List<string>();
    }

    public class TradeDecline
    {
        public string msg = "TradeDecline";
        public string inviter;
    }

    public class TradeInvite
    {
        public string msg = "TradeInvite";
        public string profile;
    }

    public class TradeInviteForward
    {
        public string msg = "TradeInviteForward";
        public User inviter = new User();
    }

    public class TradeRemoveCard
    {
        public string msg = "TradeRemoveCard";
        public int cardId;
    }

    public class TradeResponse
    {
        public string msg = "TradeResponse";
        public string status;
        public User to = new User();
        public User from = new User();
    }

    public class TradeSetGold
    {
        public string msg = "TradeSetGold";
        public int gold;
    }

    public class TradeView
    {
        public string msg = "TradeView";
        public bool modified;
        public TradeInfo to = new TradeInfo();
        public TradeInfo from = new TradeInfo();

        public class TradeInfo
        {
            public User profile = new User();
            public List<int> cardIds = new List<int>();
            public int gold;
            public bool accepted;
        }
    }

    public class Whisper
    {
        public string msg = "Whisper";
        public string toProfileName;
        public string from;
        public string text;
    }
}
